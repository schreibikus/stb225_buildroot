# stb225 buildroot
This is makefile for building the Linux image for a STB(Set Top Box) based on PNX8335(stb225).
The main target of this image: to use STB only as Linux server.

## How to choose needed the Linux kernel version

### Currently, the default Linux kernel is version 5.15.22

### For using Linux 4.4.302 by default
Make the following configuration changes:
* Change "Toolchain" -> "Custom kernel headers series" to "4.4.x"
* Change "Kernel" -> "Kernel version" to "4.4.302"
* Change "Kernel" -> "Custom kernel patches" to "$(TOPDIR)/linux/pnx8335/linux-4.4-*.patch"

### For using Linux 4.9.300 by default
Make the following configuration changes:
* Change "Toolchain" -> "Custom kernel headers series" to "4.9.x"
* Change "Kernel" -> "Kernel version" to "4.9.300"
* Change "Kernel" -> "Custom kernel patches" to "$(TOPDIR)/linux/pnx8335/linux-4.9-*.patch"

### For using Linux 4.14.265 by default
Make the following configuration changes:
* Change "Toolchain" -> "Custom kernel headers series" to "4.14.x"
* Change "Kernel" -> "Kernel version" to "4.14.265"
* Change "Kernel" -> "Custom kernel patches" to "$(TOPDIR)/linux/pnx8335/linux-4.19-*.patch"

### For using Linux 4.19.228 by default
Make the following configuration changes:
* Change "Toolchain" -> "Custom kernel headers series" to "4.19.x"
* Change "Kernel" -> "Kernel version" to "4.19.228"
* Change "Kernel" -> "Custom kernel patches" to "$(TOPDIR)/linux/pnx8335/linux-4.19-*.patch"

### For using Linux 5.4.178 by default
Make the following configuration changes:
* Change "Toolchain" -> "Custom kernel headers series" to "5.4.x"
* Change "Kernel" -> "Kernel version" to "5.4.178"
* Change "Kernel" -> "Custom kernel patches" to "$(TOPDIR)/linux/pnx8335/linux-5.4-*.patch"

### For using Linux 5.10.99 by default
Make the following configuration changes:
* Change "Toolchain" -> "Custom kernel headers series" to "5.10.x"
* Change "Kernel" -> "Kernel version" to "5.10.99"
* Change "Kernel" -> "Custom kernel patches" to "$(TOPDIR)/linux/pnx8335/linux-5.10-*.patch"

### For using Linux 5.16.8 by default
Make the following configuration changes:
* Change "Toolchain" -> "Custom kernel headers series" to "5.15.x or later"
* Change "Kernel" -> "Kernel version" to "5.16.8"
* Change "Kernel" -> "Custom kernel patches" to "$(TOPDIR)/linux/pnx8335/linux-5.15-*.patch"

## Build Linux image
To build the image run make in this directory.
Please find image at buildroot-*/output/images

## Configure u-boot and Writing image to NAND flash
Load by Y-modem Linux kernel image in to RAM using command:

```
loady 0x80800000 115200
```

Change the NAND flash partitioning with following command:

```
setenv mtdparts 'mtdparts=gen_nand:16k(Boot0),560k(Boot1),3M(Ker0),3M(Ker1),64k(EnvFs),20M(Kernel),-(Filesystem)'
```

Write Linux image to Flash:

```
nand erase Kernel
nand write 0x80800000 Kernel 0x1400000
```

Modify last variable

```
setenv bootcmd 'nand read 0x80800000 Kernel; run setargs; bootm 0x80800000'
saveenv
```

## Preparation in Linux:
For mounting FAT USB-flash drive add following line in /mnt/nand/fstab file:

/dev/sda1 /mnt/downloads   vfat  iocharset=utf8,uid=1000,gid=1000 0 0

or if you have ext4 USB-Flash:

/dev/sda1 /mnt/downloads   ext4  defaults 0 0

To configure WIFI, you must create the configuration file /mnt/nand/wpa_supplicant.conf.
You can also copy the existing /etc/wpa_supplicant.conf file to the /mnt/nand directory and edit it.

To configure login through ssh, you must set the root password and edit /etc/ssh/sshd_config by adding the following line:

PermitRootLogin yes
