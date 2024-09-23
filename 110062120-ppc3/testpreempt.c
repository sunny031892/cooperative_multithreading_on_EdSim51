#include <8051.h>
#include "preemptive.h"

// Create a semaphore with initial value n
void SemaphoreCreate(char *s, char n) {
    __critical {
        *s = n;
    }
    return;
}

/* 
 * @@@ [2pt] 
 * declare your global variables here, for the shared buffer 
 * between the producer and consumer.  
 * Hint: you may want to manually designate the location for the 
 * variable.  you can use
 *        __data __at (0x30) type var; 
 * to declare a variable var of the type
*/

// Global variables for shared buffer and threading
__data __at (0x25) ThreadID Cur_ID;  // Current thread ID
__data __at (0x36) char Mutex;       // Mutex semaphore for mutual exclusion
__data __at (0x37) char Full;        // Semaphore indicating buffer is full
__data __at (0x38) char Empty;       // Semaphore indicating buffer is empty
__data __at (0x39) char Word;        // Character to be produced
__data __at (0x3A) char Head;        // Head index for buffer
__data __at (0x3B) char Tail;        // Tail index for buffer
__data __at (0x3D) char Buffer[3] = {' ', ' ', ' '};  // Circular buffer

/* [8 pts] for this function
 * the producer in this test program generates one characters at a
 * time from 'A' to 'Z' and starts from 'A' again. The shared buffer
 * must be Empty in order for the Producer to write.
 */
void Producer(void) {
    /*
    * @@@ [2 pt]
    * initialize producer data structure, and then enter
    * an infinite loop (does not return)
    */

    /* @@@ [6 pt]
    * wait for the buffer to be available, 
    * and then write the new data into the buffer
    */
    Word = 'A';
    while (1) {
        SemaphoreWait(Empty); // Wait until buffer has empty space
        SemaphoreWait(Mutex); // Enter critical section
        __critical {
            Buffer[Tail] = Word; // Add new character to buffer
            Tail++; // Update tail index
            if (Tail == 3) Tail = 0;
            if (Word == 'Z') Word = 'A'; // Update character
            else Word++;
        }
        SemaphoreSignal(Mutex); // Leave critical section
        SemaphoreSignal(Full); // Signal buffer is full
    }       
}

/* [10 pts for this function]
 * the consumer in this test program gets the next item from
 * the queue and consume it and writes it to the serial port.
 * The Consumer also does not return.
 */
void Consumer(void) {
    /* @@@ [2 pt] initialize Tx for polling */

    /* @@@ [2 pt] wait for new data from producer
    * @@@ [6 pt] write data to serial port Tx, 
    * poll for Tx to finish writing (TI),
    * then clear the flag
    */

    TMOD |= 0x20;
    TH1 = (char)-6;
    SCON = 0x50;
    TR1 = 1;
    TI = 1;
    while (1) {
        SemaphoreWait(Full); // Wait for data in buffer
        SemaphoreWait(Mutex); // Enter critical section
        __critical {
            while (!TI); // Wait for Tx to be ready
            SBUF = Buffer[Head]; // Send character from buffer
            TI = 0; // Clear Tx interrupt flag
            Head++;
            if (Head == 3) Head = 0; // Circular increment of head;
        }
        SemaphoreSignal(Mutex); // Exit critical section
        SemaphoreSignal(Empty); // Signal buffer is empty
    }
}

/* [5 pts for this function]
 * main() is started by the thread bootstrapper as thread-0.
 * It can create more thread(s) as needed:
 * one thread can acts as producer and another as consumer.
 */
void main(void) {
    /* 
    * @@@ [1 pt] initialize globals 
    * @@@ [4 pt] set up Producer and Consumer.
    * Because both are infinite loops, there is no loop
    * in this function and no return.
    */
    SemaphoreCreate(&Mutex, 1); // Create mutex semaphore
    SemaphoreCreate(&Full, 0); // Create full semaphore
    SemaphoreCreate(&Empty, 3); // Create empty semaphore
    Head = 0; // Initialize head index
    Tail = 0; // Initialize tail index

    Cur_ID = ThreadCreate(Producer); // Create producer thread
    // Assembly instructions to set up the stack pointer
    __asm
        MOV  0x25, #48
        MOV  sp, 0x20
    __endasm;
    Consumer();
}

void _sdcc_gsinit_startup(void) {
    __asm
        ljmp  _Bootstrap
    __endasm;
}
void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}

void timer0_ISR(void) __interrupt(1) {
    __asm
        ljmp  _myTimer0Handler
    __endasm;
}
