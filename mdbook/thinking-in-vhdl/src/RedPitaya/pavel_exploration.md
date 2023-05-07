# Extended Exploration

Following more of pavel's toolkit.

## [Buffers for AXI4-Lite and AXI4-Stream Interfaces](http://pavel-demin.github.io/red-pitaya-notes/axi-interface-buffers/)

AXI4 protocol requires no combinational paths between input and output signals.

```
Unpacking this.....
AXI = Advanced eXtensible Interface
Design by ARM corp to act between chips on a SoC
Adopted by Xilinx as open.

5 way non-time critical channels
Write Address (AW)
Write Data (W)
Write Response (B)
Read Address (AR)
Read Data (R)

Lots of possible implementations allowable.
AXI3, AXI4, AXI4-Lite, AXI4-Stream
```
To look at in more detail at a later date when I know enough hardware comms terminology.

## Alpine + Pre-Built Applications

Bootable SD card image is provided and has start.sh/stop.sh scripts plus a web interface.  Supports the
RedPitaya DNS-SD rp-f0xxxx.local option. The zip file is a mere 100MB which is pretty impressive.

However, the zip file is not an image zip file.  Using the image.sh script to create boot and root partitions
and then unzipping the root partition files (mostly etc/ stuff) and copy the uImage and so on to the boot 
partition doesn't give a working system.

This is a good chance to check out the steps to bring up a console for debugging images on the PS system.
The Red Pitaya (STEM 125-14 version) has a micro USB connect marked as CONS. They have engineered this
nicely to put the FTDI chip on the RP board so that just a USB to uUSB cable is required and then any
reasonable terminal console program can connect to /dev/ttyUSB0 (or on Windows the FTDI driver must be installed.)

With the serial port settings as 115200, 8N1 we get the following response to the partially created image card

```
U-Boot 2021.04 (Mar 22 2022 - 19:10:16 +0100)

  CPU:   Zynq 7z010
  Silicon: v3.1
  Model: Red Pitaya Board
  DRAM:  ECC disabled 512 MiB
  MMC:   mmc@e0100000: 0
  Loading Environment from EEPROM... OK
  In:    serial@e0000000
  Out:   serial@e0000000
  Err:   serial@e0000000
  Net:
  ZYNQ GEM: e000b000, mdio bus e000b000, phyaddr 1, interface rgmii-id
  eth0: ethernet@e000b000
  Hit any key to stop autoboot:  0
  Importing environment from SD...
  Device: mmc@e0100000
  Manufacturer ID: 82
  OEM: 4a54
  Name: NCard
  Bus Speed: 50000000
  Mode: SD High Speed (50MHz)
  Rd Block Len: 512
  SD version 3.0
  High Capacity: Yes
  Capacity: 7.5 GiB
  Bus Width: 4-bit
  Erase Group Size: 512 Bytes
  506 bytes read in 6 ms (82 KiB/s)
  5224368 bytes read in 298 ms (16.7 MiB/s)
  12497 bytes read in 13 ms (938.5 KiB/s)
  Failed to load 'uInitrd'
```

At this point, we need a short diversion to learn a bit of u-boot.


