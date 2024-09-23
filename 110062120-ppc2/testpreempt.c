#include <8051.h>
#include "preemptive.h"

/* 
 * @@@ [2pt] 
 * declare your global variables here, for the shared buffer 
 * between the producer and consumer.  
 * Hint: you may want to manually designate the location for the 
 * variable.  you can use
 *        __data __at (0x30) type var; 
 * to declare a variable var of the type
*/

__data __at (0x25) ThreadID Cur_ID;
__data __at (0x3D) char Word; // The character currently being produced
__data __at (0x3E) char Buffer; // Shared buffer between producer and consumer
__data __at (0x3F) int Buffer_full; // Flag indicating if Buffer is full

/* [8 pts] for this function
 * the producer in this test program generates one characters at a
 * time from 'A' to 'Z' and starts from 'A' again. The shared buffer
 * must be empty in order for the Producer to write.
 */
void Producer(void) {
    /*
        * @@@ [2 pt]
        * initialize producer data structure, and then enter
        * an infinite loop (does not return)
        */
    Word = 'A';
    while (1) {
        /* @@@ [6 pt]
        * wait for the buffer to be available, 
        * and then write the new data into the buffer
        */
        if (Buffer_full == 0) {
            // consumer consume
            Buffer = Word;
            if (Word == 'Z') 
                Word = 'A';
            else
                Word++;
            Buffer_full = 1;
        }
    }       
}

/* [10 pts for this function]
 * the consumer in this test program gets the next item from
 * the queue and consume it and writes it to the serial port.
 * The Consumer also does not return.
 */

// Consumes characters from the buffer and writes to serial port
void Consumer(void) {
    /* @@@ [2 pt] initialize Tx for polling */
    TMOD |= 0x20;
    TH1 = (char)-6;
    SCON = 0x50;
    TR1 = 1;
    TI = 1;
    while (1) {
        /* @@@ [2 pt] wait for new data from producer
        * @@@ [6 pt] write data to serial port Tx, 
        * poll for Tx to finish writing (TI),
        * then clear the flag
        */
        if (Buffer_full != 0) {
            // producer has produced
            while (!TI); // Wait for Tx to be ready
            SBUF = Buffer; // Write buffer to serial port
            TI = 0; // Clear Tx interrupt flag
            Buffer_full = 0;
        }
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
    Buffer_full = 0;
    Buffer = ' ';
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
