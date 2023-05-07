# My First VHDL

The LED blinker example gives a very gentle way to start working in VHDL.  As with any 
hello world type project, the focus is more on the basic syntax and tooling to go from
a program file to a runnable code than on anything more.

So, we need to identify where the code for the LED blinker exists.  From the git repo 
that provides the project setup it is easy to identify the project code.  Note that
the author provides his own explanation of the toolchain and project setup via
his slides at 
[Club Vivado 2016](https://www.xilinx.com/products/design-tools/vivado/club_vivado_2016_archives.html)

Looking at the files, there is virtually no VHDL required to establish a flashing light.
This is not unexpected.  Just as with a hello world program, where there is little or no surprise
that the body of the main code will be a call to a print function with a string argument, the actual
interest is in the runtime that supports the print function having existence and having an end
point to which the characters can be sent.

Here we find the very nice element of the Vivado toolkit which is the use of the TCL scripting
language to automate actions that can also be taken interactively via the GUI environment.

The block_design.tcl for the blinker project has a number of stanzas which respectively:

1. Run the clock wizard to establish a clock at 125 (MHz? or HZ - TBA)
1. Instantiate a processing system (the Zynq CPU env) importing from a red_pitaya.xml preset file.
1. The system clock is linked via AXI bus to the PLL clock (and hence we now know it is MHz)
1. A block automation function is requested to make the "necessary" (default) interconnections between the PSI, IO and DDR memory.
1. An instance of a c_counter_binary block is created with a 32 bit counter width and it is connected to the PLL clock.

At this point, we can infer that the counter is going to increment on some kind of default clock edge (rising?).
The counter ranges over 0 to (2^32 - 1) and at 125 MHz, this counter will wrap around every 34 seconds.
To put it another way, the MSB will toggle every 34 seconds. By symmetry and binary, the next significant bit will
toggle every 17 seconds and the nth bit will toggle every (34/2^n) seconds and so we can choose a flashing rate
for an LED, by selecting the appropriate bit in the counter that toggles at the period we desire.

The last part of the design is to instantiate a custom port_slicer block which comes from the pavel-demin
IP library (to be found later).  This takes the counter as a 32 bit input signal, and extracts a subset
of the bits (contiguous, non-contiguous TBA).  We slice out bit 26 which will have the period 34/(32) or just
over one second.  The output is mapped to the led_o pin.

The TCL code is written in abstract terms, and one of the next things to identify how led_o shall be 
connected to a physical wire on the RedPitaya corresponding to a real LED.  This likely comes from a mapping
file.

We also need to find out where the port_slicer block is defined. A little searching finds this easily.


