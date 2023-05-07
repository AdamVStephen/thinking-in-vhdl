# Real-Time Tuning

Achieving deterministic response demands understanding in detail how the hardware,
firmware, operating system and application software work.  A very light treatment
of the main issues is presented in this chapter, with a practical, need-to-know
justification for the techniques which allow MARTe performance to be optimally
tuned.

## CPU Architecture and Terminology

For a more accurate and detailed treatment of compute hardware, see Appendix [TBA].

Digital Logic: clocked boolean circuits that perform basic computation (counter, adder)

ISA: instruction set architecture defining higher level operations implemented by logic blocks (load memory to register, test) 

CPU: a chip seated in a single system board socket comprising multiple digital logic circuits which can execute
general purpose programs consisting of sets of instructions and data.

Core: a CPU block that can execute one instruction at a time.

Thread (Hardware): a virtual core

Multi-processor, multi-core, multi-thread arhic

## Kernel Space and User Space

After basic hardware initialisation (BIOS, UEFI or equivalent), some kind of bootloader process
is responsible for finding and starting an operating system image.  Some processor instructions
and memory addressed peripheral I/O regions require code to be executed at a privilege level
in which incorrect sequences could cause system failures.  This code is therefore restricted
to be run and is usually termed "kernel space" code.  The kernel manages hardware and creates
contexts in which less privileged code ("user space code") will run.  The interface to the
hardware and kernel services is defined by means of `system calls`.

## Processes and Threads (Software) 

When the kernel launches a long running function, this is termed starting a process.
Each process is allocated stack space, access to allocated memory and has various
meta-data which keep track of the resources and state.  When a process needs to create
multiple parallel execution contexts, it may create separate independent processes
(by `fork` and `exec`, or similar system calls), or it may create separate coupled
`threads` which while they have their own stack and register states, share 
memory and data structures with the original process.

## Linux Scheduler

The Linux scheduler is responsible for allocating execution hardware unit time to the
collection of processes and threads which have been started on a system.
Various options exist for controlling the amount of compute resource/time which each
execution unit may consume before it is required to pause while other
units are given time to run.  These are scheduler policies.  Schemes to define
priority and to interleave code that is blocked waiting for I/O with code that
has data to be processed as well as API and commands for changing the scheduling
status of execution units are provided.

Boot time configuration, and run-time updates allow for requesting that the scheduler
restrict process/threads to specific CPU cores/threads (or sets thereof).  If the kernel
configuration permits this, it can ensure that applications with specific needs
for low-latency, low-jitter execution be undisturbed by system load.  There are limits
on the extent to which this can be successful.

## CPU Isolation

`isolcpus=0`

`taskset`

`RunOnCPU`

## IRQ Isolation

## Avoiding Deadlock

## Fully Decoupling CPUs from OS

## Monitoring and Measuring

## Tips and Tricks

## References and Further Reading

