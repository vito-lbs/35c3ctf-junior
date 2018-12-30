# rare_mount

download was a jffs2 image (looked up the magic number from the first 4 bytes
of the file)

doesn't mount loopback, idk why, some page suggested copying it to a block
device in ram

```
sudo modprobe mtdram total_size=10000000 erase_size=128
sudo modprobe mtdblock
sudo dd if=ffbde7acedff79aa36f0f5518aad92d3-rare-fs.bin of=/dev/mtdblock0
sudo mount -t jffs2 /dev/mtdblock0 /mnt/rare_mnount
```

but it's the wrong endianness

```
sudo apt install mtd-utils
ffs2dump -v -b -r -efixed.bin ffbde7acedff79aa36f0f5518aad92d3-rare-fs.bin
sudo dd if=fixed.bin of=/dev/mtdblock0
sudo mount -t jffs2 /dev/mtdblock0 /mnt/rare_mnount
```

and there's file called `flag`
