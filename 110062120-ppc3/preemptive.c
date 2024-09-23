#include <8051.h>

#include "preemptive.h"

/*
 * @@@ [2 pts] declare the static globals here using 
 *        __data __at (address) type name; syntax
 * manually allocate the addresses of these variables, for
 * - saved stack pointers (MAXTHREADS)
 * - current thread ID
 * - a bitmap for which thread ID is a valid thread; 
 *   maybe also a count, but strictly speaking not necessary
 * - plus any temporaries that you need.
 */

__data __at (0x20) int SP0;
__data __at (0x21) int SP1;
__data __at (0x22) int SP2;
__data __at (0x23) int SP3;
__data __at (0x24) int Map; // Bitmap for valid thread IDs
__data __at (0x25) ThreadID Cur_ID;
__data __at (0x30) int SP_old;
__data __at (0x31) int SP_new;
__data __at (0x32) ThreadID New_ID; // New thread ID being created

/*
 * @@@ [8 pts]
 * define a macro for saving the context of the current thread by
 * 1) push ACC, B register, Data pointer registers (DPL, DPH), PSW
 * 2) save SP into the saved Stack Pointers array
 *   as indexed by the current thread ID.
 * Note that 1) should be written in assembly, 
 *     while 2) can be written in either assembly or C
 */

//saving the current thread context
#define SAVESTATE { \
    __asm \
        PUSH ACC \
        PUSH B \
        PUSH DPL \
        PUSH DPH \
        PUSH PSW \
    __endasm; \
    if (Cur_ID == '0') { \
        __asm \
            MOV 0x20, SP \
        __endasm; \
    } else if (Cur_ID == '1'){ \
        __asm \
            MOV 0x21, SP \
        __endasm; \
    } else if (Cur_ID == '2'){ \
        __asm \
            MOV 0x22, SP \
        __endasm; \
    } else if (Cur_ID == '3'){ \
        __asm \
            MOV 0x23, SP \
        __endasm; \
    } \
}


/*
 * @@@ [8 pts]
 * define a macro for restoring the context of the current thread by
 * essentially doing the reverse of SAVESTATE:
 * 1) assign SP to the saved SP from the saved stack pointer array
 * 2) pop the registers PSW, data pointer registers, B reg, and ACC
 * Again, popping must be done in assembly but restoring SP can be
 * done in either C or assembly.
 */

//restoring the current thread context
#define RESTORESTATE { \
    if (Cur_ID == '0') { \
        __asm \
            MOV SP, 0x20 \
        __endasm; \
    } else if (Cur_ID == '1'){ \
        __asm \
            MOV SP, 0x21 \
        __endasm; \
    } else if (Cur_ID == '2'){ \
        __asm \
            MOV SP, 0x22 \
        __endasm; \
    } else if (Cur_ID == '3'){ \
        __asm \
            MOV SP, 0x23 \
        __endasm; \
    } \
    __asm \
        POP PSW \
        POP DPH \
        POP DPL \
        POP B \
        POP ACC \
    __endasm; \
}

 /* 
  * we declare main() as an extern so we can reference its symbol
  * when creating a thread for it.
  */

extern void main(void);

/*
 * Bootstrap is jumped to by the startup code to make the thread for
 * main, and restore its context so the thread can run.
 */

void Bootstrap(void) {
      /*
       * @@@ [2 pts] 
       * initialize data structures for threads (e.g., mask)
       *
       * optional: move the stack pointer to some known location
       * only during bootstrapping. by default, SP is 0x07.
       * 
       * @@@ [2 pts]
       *     create a thread for main; be sure current thread is
       *     set to this thread ID, and restore its context,
       *     so that it starts running main().
       */

    Map = 0x00; // Clear thread bitmap indicating no threads are running
    SP0 = 0x3F; // Initialize stack pointer
    SP1 = 0x4F;
    SP2 = 0x5F;
    SP3 = 0x6F;

    // Initialize timer and interrupts for preemption
    TMOD = 0;  // timer 0 mode 0
    IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
    // EA  -  ET2  ES  ET1  EX1  ET0  EX0
    TR0 = 1; // set bit TR0 to start running timer 0

    Cur_ID = ThreadCreate(main);
    RESTORESTATE; //restore the state of new create main thread
}

//Timer interrupt handler for thread preemption
void myTimer0Handler(void) {
    EA = 0; // Disable interrupts
    SAVESTATE; // Save current thread state
    do {
        // Cycle through thread IDs to find the next valid thread
        if (Cur_ID == '0') Cur_ID = '1';
        else if (Cur_ID == '1') Cur_ID = '2';
        else if (Cur_ID == '2') Cur_ID = '3';
        else Cur_ID = '0';
        
        // Break out of the loop if a valid thread is found
        if (((Cur_ID == '0') && ((Map & 0x01) == 0x01)) ||
            ((Cur_ID == '1') && ((Map & 0x02) == 0x02)) ||
            ((Cur_ID == '2') && ((Map & 0x04) == 0x04)) ||
            ((Cur_ID == '3') && ((Map & 0x08) == 0x08))) {
            break;
        }
    } while (1);
    RESTORESTATE; // Restore the state of the next thread
    EA = 1; // Re-enable interrupts
    // Return from interrupt
    __asm
        RETI
    __endasm;
}

/* 
 * ThreadCreate() creates a thread data structure so it is ready
 * to be restored (context switched in).
 * The function pointer itself should take no argument and should
 * return no argument.
 */
ThreadID ThreadCreate(FunctionPtr fp) {
        /*
        * @@@ [2 pts] 
        * check to see we have not reached the max #threads.
        * if so, return -1, which is not a valid thread ID.
        */
         
        EA = 0;

        if ((Map & 0xFF) == 0xFF) return -1; // Return -1 if no available thread IDs

        // Initialize New_ID
        New_ID = 'x';

        // Check each thread ID (0 to 3) to find an available one
        // For each thread ID, perform bitwise AND with Map and check if the result is 0
        // If 0, it means the thread ID is available for use
        if ((Map & 0x01) == 0x00) {
            // If Thread 0 is available:
            // - Set New_ID to '0'
            // - Update Map to indicate Thread 0 is now in use
            // - Set SP_new to the starting stack location for Thread 0
            __asm
                MOV 0x32, #48
                ORL 0x24, #01
                MOV 0x31, 0x20
            __endasm;
        } else if ((Map & 0x02) == 0x00) {
            __asm
                MOV 0x32, #49
                ORL 0x24, #02
                MOV 0x31, 0x21
            __endasm;
        } else if ((Map & 0x04) == 0x00) {
            __asm
                MOV 0x32, #50
                ORL 0x24, #04
                MOV 0x31, 0x22
            __endasm;
        } else if ((Map & 0x08) == 0x00) {
            __asm
                MOV 0x32, #51
                ORL 0x24, #08
                MOV 0x31, 0x23
            __endasm;
        }
         
        // Save the current SP in SP_old
        // Set SP to the new thread's starting stack location
        __asm
            MOV 0x30, sp
            MOV sp, 0x31
        __endasm;
        
        // Push the return address (fp) onto the stack for the new thread
        __asm
            PUSH DPL
            PUSH DPH
        __endasm;

        // Initialize the registers to 0 for the new thread
        __asm
            MOV A, 0x00
            PUSH ACC  // ACC
            PUSH ACC  // B
            PUSH ACC  // DPL
            PUSH ACC  // DPH
        __endasm;

        // Set up the PSW (Processor Status Word) for the new thread and save its SP
        // PSW setup depends on the thread ID to use the correct register bank        
        if (New_ID == '0') {
        __asm
            MOV PSW, #0x00
            PUSH PSW
            MOV 0x20, SP
        __endasm;
        } else if (New_ID == '1') {
        __asm
            MOV PSW, #0x08
            PUSH PSW
            MOV 0x21, SP
        __endasm;
        } else if (New_ID == '2') {
        __asm
            MOV PSW, #0x10
            PUSH PSW
            MOV 0x22, SP
        __endasm;
        } else if (New_ID == '3') {
        __asm
            MOV PSW, #0x18
            PUSH PSW
            MOV 0x23, SP
        __endasm;
        }

        // Restore the original SP from SP_old
        __asm
            MOV sp, 0x30
        __endasm;

        EA = 1;
        return New_ID;
}

/*
 * this is called by a running thread to yield control to another
 * thread.  ThreadYield() saves the context of the current
 * running thread, picks another thread (and set the current thread
 * ID to it), if any, and then restores its state.
 */

void ThreadYield(void) {
      SAVESTATE;
      do {
         /*
         * @@@ [8 pts] do round-robin policy for now.
         * find the next thread that can run and 
         * set the current thread ID to it,
         * so that it can be restored (by the last line of 
         * this function).
         * there should be at least one thread, so this loop
         * will always terminate.
         */

        // Cycle through thread IDs and select the next valid thread
        if (Cur_ID == '0') Cur_ID = '1';
        else if (Cur_ID == '1') Cur_ID = '2';
        else if (Cur_ID == '2') Cur_ID = '3';
        else Cur_ID = '0';

        // Break out of the loop if a valid thread is found
        if (((Cur_ID == '0') && ((Map & 0x01) == 0x01)) ||
            ((Cur_ID == '1') && ((Map & 0x02) == 0x02)) ||
            ((Cur_ID == '2') && ((Map & 0x04) == 0x04)) ||
            ((Cur_ID == '3') && ((Map & 0x08) == 0x08))) {
            break;
        }
      } while (1);
      RESTORESTATE;
}


/*
 * ThreadExit() is called by the thread's own code to terminate
 * itself.  It will never return; instead, it switches context
 * to another thread.
 */
void ThreadExit(void) {
    /*
    * clear the bit for the current thread from the
    * bit mask, decrement thread count (if any),
    * and set current thread to another valid ID.
    * Q: What happens if there are no more valid threads?
    */
    // Clear the current thread from the thread bitmap and set up for context switch 
    // Modify the thread bitmap to indicate the current thread is no longer valid
    if (Cur_ID == '0') {
        __asm
        ANL 0x24, #11111110
        __endasm;
    } else if (Cur_ID == '1') {
        __asm
        ANL 0x24, #11111101
        __endasm;
    } else if (Cur_ID == '2') {
        __asm
        ANL 0x24, #11111011
        __endasm;
    } else if (Cur_ID == '3') {
        __asm
        ANL 0x24, #11110111
        __endasm;
    }
    do {
        // Cycle through thread IDs to find the next valid thread
        if (Cur_ID == '0') Cur_ID = '1';
        else if (Cur_ID == '1') Cur_ID = '2';
        else if (Cur_ID == '2') Cur_ID = '3';
        else Cur_ID = '0';

        // Break out of the loop if a valid thread is found
        if (((Cur_ID == '0') && ((Map & 0x01) == 0x01)) ||
            ((Cur_ID == '1') && ((Map & 0x02) == 0x02)) ||
            ((Cur_ID == '2') && ((Map & 0x04) == 0x04)) ||
            ((Cur_ID == '3') && ((Map & 0x08) == 0x08))) {
            break;
        }
    } while (1);
    RESTORESTATE;
}
