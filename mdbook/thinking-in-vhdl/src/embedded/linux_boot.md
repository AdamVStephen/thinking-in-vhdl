# Linux Boot

From the alpine boot image we have got as far as the uImage linux startup, 
but the point where the root filesystem is remounted and the init process
runs has stopped.

```
/ # ls -l /dev/mmc*
brw-rw----    1 root     root      179,   0 Jan  1 00:00 /dev/mmcblk0
brw-rw----    1 root     root      179,   1 Jan  1 00:00 /dev/mmcblk0p1
brw-rw----    1 root     root      179,   2 Jan  1 00:00 /dev/mmcblk0p2
/ # ls /
bin      etc      lib      newroot  root     sbin     sysroot  usr
dev      init     media    proc     run      sys      tmp
/ # mkdir /mnt/test
mkdir: can't create directory '/mnt/test': No such file or directory
/ # mkdir -p /mnt/test
/ # mount /dev/mmcblk0p2 /mnt/test
EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
/ # ls /mnt/test
apps        etc         lost+found  root        wifi
```


The root filesystem indeed seems totally deficient, so maybe the intent
is to overlay the etc/ directory on top of the root filesystem which
is included in the uImage.  We need to understand more this process
of the remount, and how this is being triggered from the init process
in the uImage.


The simplest approach to fixing this seems to be not to overthink it.
Having looked at the Debian example with two partitions, I jumped to the
assumption that with Alpine the same would apply.  Rereading Pavel's very
excellent instructions, this is not the case.

Retrying (following the instructions) we get....
