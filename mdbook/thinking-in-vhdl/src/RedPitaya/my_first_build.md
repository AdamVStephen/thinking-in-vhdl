# My First Build

We have looked at the project source code which brings together a handful of blocks (xilinx and custom).
We have looked at the VHDL source code for the port slicer.
The build instructions are very top level

```
source /opt/Xilinx/Vitis/202.2/settings64.sh
make NAME=led_blinker all
```

So now we need to understand what this triggered, and how we might reproduce this in a Windows Xilinx environment.

The top level Makefile has 165 lines of code.  We will pick out a a few of the key variables and commands.

1. CORES lists several tens of core names.  Most appear to come from Xilinx libraries, some are custom code.
1. VIVADO is defined to run `vivado -nolog -nojournal -mode batch`
1. Numerous variables define the location of Uboot, Linux and Device tree template code and RTL ethernet driver definitions.
1. Some of the variables have names evidencing bugs and iterations in these low level definition type data.
1. The **all** target includes building the project.bit, boot.bin, uImage and devicetree.dtb
1.1 It is expected that subsequent modifications ought not to require rebuilding boot.bin, uImage and devicetree.dtb but this RTBS.
1. Other types of file are .xpr (constraints?) and .bit
1. The externally referenced definitions are pulled down via *curl*
1. The uboot sources are patched from the zynq_red_pitaya device tree additions.
1. The linux sources are expanded with realtek RTL8192 wireless drivers
1. The linux sources get some other patches including definition of the /dev/xdevcfg
1. The device tree is likewise patched and then packaged.

Now we start compiling code

1. uImage is built from the linux sources, using the arm cross compiler and setting the load address in memory 0x8000.
1. The configuration for the kernel is defined in a xilinx_zynq_defconfig file
1. The uboot bootloader is likewaise cross compiled
1. The boot.bin bootloader combines the produced first stage bootloader and uboot second level boot loader
1.1 Specific addresses known to the FSBL, UBOOT and ARM processor must be provided
1. The device tree blob is made from the uImage and the device tree spec file (dts) using the device tree compiler (drc)
  
Finally we start compiling VHDL cores

1. cores are compiled with the VIVADO command and the scripts/core.tcl driver file.
1. xpr files are generated using the scripts/project.tcl file (Xilinx projects ?)
1. xsa files are generated from xpr files using the scripts/hwdef.tcl script
1. bit stream files are produced from the xpr files with the scripts/bitstream.tcl file
1. The first stage bootloader is assembled from the XSA files.
1. The device tree is patched from the XSA files.

A number of temporary files can be deleted to save space including

1. uImage, boot.bin and devicetree.dtb which are merged into the img file.
1. .Xil and html/xml statistics reports
1. *.jou journal files and *.log files from vivado and also from webtalk

Query : what is "webtalk" ?  Is this similar to Koheron ?
