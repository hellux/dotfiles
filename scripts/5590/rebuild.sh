cd /usr/src/linux
make all
make modules_install
mount /boot
make install
release=$(cat include/config/kernel.release)
cp /boot/vmlinuz-$release /boot/efi/boot/bootx64.efi
umount /boot
