#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4  

// for concatenating symbols
// Add _ in front and $ in tail
#define CNAME(s) _ ## s
#define LABELNAME(label) label ## $

// signal (increment) a semaphore
#define SemaphoreSignal(s) { \
    __asm \
        INC CNAME(s) \
    __endasm; \
}

// 1. check semaphore value 2. wait if zero 3. decrement semaphore
#define SemaphoreWaitBody(s, label) { \
    __asm \
        LABELNAME(label): MOV ACC, CNAME(s) \
                        JZ LABELNAME(label) \
                        DEC CNAME(s) \
    __endasm; \
}

// wait (decrement) a semaphore
#define SemaphoreWait(s) { \
    SemaphoreWaitBody(s, __COUNTER__) \
}

typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);


#endif