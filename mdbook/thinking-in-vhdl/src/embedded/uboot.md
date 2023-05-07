# U-Boot

The [u-boot docs](https://u-boot.readthedocs.io/en/latest/) are very thorough.  Some of the details
that are referenced point to the [source]() so it is worth taking a copy to be able to grep through.

```
git clone https://source.denx.de/u-boot/u-boot.git
```

For a relatively small piece of code, there are 922443 objects in the git repo, whose total size
is about 250MB.  This probably reflects the breadth and diversity of supported devices in the
general embedded space.

Stuck at the Zynq prompt, the first command we need to learn is how to look at the files on the
boot medium.  In our case on a RedPitaya booting from SD card, we can check the possible device
names from the source. The [partitions](https://u-boot.readthedocs.io/en/latest/usage/partitions.html)
documentation notes that the general command syntax referring to anything that supports a partition 
is

```
<command> <interface> [devnum].[hwparnum][:partnum|#partname]
```

and the interfaces are listed in the uclass_idname_str array in drivers/block/blk-uclass.c

```
```

Note that the partition name syntax is different for GPT and MBR partitions.

In our case, we expect two partitions on the device, one fat16, one ext4.  The SD card
interface is a type of MMC memory.

```
Zynq> ls mmc 0.0:1 /
   530336   boot.bin
    12497   devicetree.dtb
  5224368   uImage
      506   uEnv.txt

               4 file(s), 0 dir(s)

  Zynq> ls mmc 0.0:2 /
  <DIR>       4096 .
  <DIR>       4096 ..
  <DIR>      16384 lost+found
  <DIR>       4096 etc
  <DIR>       4096 root
  <DIR>       4096 apps
  <DIR>       4096 wifi
```

The missing file that the boot loader seeks is `uInitrd` so we add this to the image building script
and retry.  This gets as far as booting the uImage kernel - so we are post u-boot and into Linux.

```
Alpine Init 3.5.0-r0
Loading boot drivers...
 * Loading boot drivers: Loading boot drivers: ok.
 ok.
 Mounting boot media...
  * Mounting boot media: EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
    random: fast init done
    Mounting boot media: failed.
    failed.
    initramfs emergency recovery shell launched. Type 'exit' to continue boot
    sh: can't access tty; job control turned off
    / # lsblk
  ```                                                   

  Now we need to look at the Linux boot sequence and root filesystem requirements.

  See [linux boot](linux_boot.md)
