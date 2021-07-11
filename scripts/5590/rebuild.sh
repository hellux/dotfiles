set -u
cd /usr/src/linux || exit
make -j8 all
make modules_install
mount /boot
make install
release=$(cat include/config/kernel.release)
cp "/boot/vmlinuz-$release" "/boot/efi/boot/bootx64.efi"
