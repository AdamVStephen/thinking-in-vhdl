# Package Bitstreams

The Xilinx tools build bitstream files with the PL side code which can be loaded into the FPGA
via the command

```
cat bitstream.bit > /dev/xdevcfg
```

To include a bitstream file in the generated image (which avoids the need for separate upload into a running system)
is much the same as putting any other set of files into the embedded Linux which gets created.  We just need to unpack
the scripts and build rules.  We work backwards.

## Bootable Image

The `scripts/image.sh` takes three arguments

1. The script which will populate the image data.  Default for this purpose `scripts/debian.sh`
1. The image file name e.g. `image-name.img`
1. The image size (assuming block size of 1M) e.g. 1024 for a 1GB image file.

The script then creates a zeroed image of the correct size using `dd` mounts it via the loopback device system (`losetup`)
and runs the provided script to populate the image with files.

## Debian Bootable Image

The `scripts/debian.sh` acts on a mounted loopback disk image and populates it with an embedded Debian suitable for the
RedPitaya SBC.  This implies a Linux image for the correct architecture, a device tree for the correct board support
package and so on.

The `scripts/debian.sh` appears to be a baseline minimal bootable system.  It makes the following main set of actions

1. Creates boot and root directories in /tmp on the host that is running (as opposed to /tmp in the image)
1. Partitions the image with a small fat16 boot partition and an ext4 root partition.
1. Creates filesystems on the partitions and mounts them.
1. **Copies boot.bin, devicetree.dtb and uImage** to the boot directory.
1. **Clones a debian base root filesystem** from debian mirror for the correct architecture
1. *Note the use of debootstrap command* This may set up some kind of special environment?
1. Runs a chroot command so that system customisation is done relative to the ARM root filesystem.
1. Installs linux modules which have been built via the Xilinx tools
1. Copies additional config files and packages (from the host system to the arm root - seems odd)
1. Customises config files in the image using inline file creation 
1.1 **This is where to customise the image e.g. for network setup or similar**
1.1 Runs apt-get commands (again - it is unexpected that this is done locally) 
1.1 Runs systemctl commands (again unpexted that this be done locally)

## Variations on the Theme

The root filesystem setup procedure documented above is trivially easy to extend.  It just needs
a little work which can easily be tested interactively on a baseline running image to work out
any additional commands and configuration, which can then be latched in a new script.

Copying files for the Zynq system from the Xilinx build is likewise trivial.

The more interesting knowledge is therefore how to expand the process of building additional 
files and other artefacts to target the RedPitaya.   
