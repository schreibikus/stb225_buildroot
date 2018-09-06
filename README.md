# stb225 transmission
This is makefile for building the Linux image for a STB(Set Top Box) based on PNX8335(stb225).
The main target of this image: to use STB only as a bittorrent client.

## Build Linux image
To build the image run make in this directory.
Please find image at buildroot-*/output/images

## Configure u-boot and Writing image to NAND flash
Load by Y-modem Linux kernel image in to RAM using command:

loady 0x80800000 115200

Change the NAND flash partitioning with following command:

setenv mtdparts 'mtdparts=gen_nand:16k(Boot0),560k(Boot1),3M(Ker0),3M(Ker1),64k(EnvFs),20M(Kernel),-(Filesystem)'

Write Linux image to Flash:

nand erase Kernel

nand write 0x80800000 Kernel 0x1400000

Modify last variable

setenv bootcmd 'nand read 0x80800000 Kernel; run setargs; bootm 0x80800000'

saveenv

## Preparation in Linux:
To get access to transmission web interface open /mnt/nand/transmission/settings.json file by vi editor
and change line from

"rpc-whitelist": "127.0.0.1",

to

"rpc-whitelist": "127.0.0.1,192.168.*.*",

For mounting FAT USB-flash drive add following line in /mnt/nand/fstab file:

/dev/sda1 /mnt/downloads   vfat  iocharset=utf8,uid=1000,gid=1000 0 0

or if you have ext4 USB-Flash:

/dev/sda1 /mnt/downloads   ext4  defaults 0 0

