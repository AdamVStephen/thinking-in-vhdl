# LED Blinker

A quick way to make sure you have a toolkit for building Red Pitaya images that can 
demonstrate how to put an embedded Linux on the ARM processor, and a simple PL program
on the rest of the FPGA is to look at http://pavel-demin.github.io/red-pitaya-notes/led-blinker/

## Development Environment

As of 2023-05-06 the example was reproduced using the following environment

1. Host laptop DELL latitude E5410 running Ubuntu Studio 22.04
1. Oracle Virtual Box 7 to create a VM in which to run all the development tools
1. Debian 11.7 installed using the Virtual install
1. Required packages as documented in the red-pitaya-notes
1. Vitis Core Development Kit 2020.2 downloaded from Xilinx (now AMD)

## Build Process

Following the instructions - worked first time (albeit took a while).

## Test Process

After flashing the SD card image and booting the system, a DHCP address will have been
allocated to the Red Pitaya, but the stock Red Pitaya mechanism of linking this to the
MAC oriented hostname will not work.  Just check your router to see which address has
been allocated.  

The led_blinker.bit bitstream is not copied into the image file, which was an unexpected
lapse, but scp makes it relatively easy to rectify this.  On VirtualBox this needs either
the correct networking config to go direct, or an intermediate shared file otherwise.

To then get the LED blinking:

```
cat led_blinker.bit > /dev/xdevcfg
```

## Next Steps

The following additional exercises provide a useful route to understanding how the example
works and how to progress to doing more interesting things.

1. [package bitstreams](package_bitstreams.md)


## Resources

* http://pavel-demin.github.io/red-pitaya-notes/led-blinker/
* https://github.com/pavel-demin/red-pitaya-notes

