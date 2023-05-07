# Pavel's Toolkit

This is a short summary of Pavel Demin's slides
given to [Club Vivado 2016](https://www.xilinx.com/products/design-tools/vivado/club_vivado_2016_archives.html)
.  The presentation title is *conquering complexity with Tcl and Make*.
There are 24 slides. Here are the main points but the presentation has been cached in this
repository [here](files/foo.pdf).


## Motivation and Approach

1. Typical application structure shown
   - ADC to DSP to FIFO to CPU to Ethernet
   -  Xilinx Vivado libraries of good DSP cores
   -  ARMv7 linux opens the data to Gb ethernet, 4G, bluetooth
1. Development toolchain from IP core to OS image typically has 10 steps
   - describe, package, instantiate and connect IP cores (4)
   - edit address segments
   - generate bitstream
   - generate hardware definition
   - generate FSBL
   - generate and patch device tree
   - patch and build U-boot
   - patch and build Linux
   - build OS image
1. Tcl commands to do all of the above need many lines of code to describe parameters
1. A complex block design may have order 100 IP cores
1. All steps are therefore to be automated with tcl/Make and higher level commands wrap the detail.
1. Designs are broken into better levels of granularity.
1. Pavel's toolkit conists of 9 scripts, 500 sloc (tcl 150, Make 116, shell 221)
   - core.tcl
   - project.tcl
   - bitstream.tcl
   - hwdef.tcl
   - fsbl.tcl
   - devicetree.tcl
   - Makefile
   - image.sh
1. There are 3 helper commands to make the tcl more concise
   - core_parameter
   - cell
   - module
1. One function Tcl cannot do is to describe IP cores.  This is done in **verilog** 


A number of aspects of this problem are common to MARTe2.

The overlap or otherwise between this approach and Koheron are TBA.

The continued relevance of Pavel's toolkit beyond 2020.2 is TBA.


## Specifics

1. Git repository with a layered structure
   - cfg/ contains constraints and board definition files
   - cores/ has IP cores written in *verilog*
   - patches/ has patches for device tree, uboot and linux
   - projects/ are vivado projects written in tcl
   - scripts/ are tcl scripts for Vivado and HSI (HSI ?) plus shell scripts to build OS images


# Command Line Workflow Options

It is possible to build all or only a subset of steps for a project.

1. Just the bitstream:  make NAME=project_name bit
1. Just the Vivado project:  make NAME=project_name xpr
1. Open the project in vivado vivado tmp/project_name.xpr
1. Then run analysis using Vivado tools


This may make it possible to work across Windows/Linux

1. [Logic Simulation](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug900-vivado-logic-simulation.pdf)
1. [Analysis](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug906-vivado-design-analysis.pdf)

# Other References

Pavel provides a handy set of links

1. [Tcl Command Ref](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug835-vivado-tcl-commands.pdf)
1. [Tcl Scripting](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug894-vivado-tcl-scripting.pdf)
1. [Design with IP](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug896-vivado-ip.pdf)
1. [Design IP Subsystems with IP Integrator](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug994-vivado-ip-subsystems.pdf)
1. [Creating and Packaging Custom IP](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug1118-vivado-creating-packaging-custom-ip.pdf)
1. [Basic Software Platform Generation](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug1138-generating-basic-software-platforms.pdf)
1. [Koheron SDK](https://www.koheron.com/software-development-kit/documentation/fpga-tcl)
