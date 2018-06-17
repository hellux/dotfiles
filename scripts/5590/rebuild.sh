version=$1

cd /usr/src/linux
sudo make all
sudo make modules_install
sudo mount /boot
sudo make install
sudo cp /boot/vmlinuz-$version-gentoo /boot/efi/boot/bootx64.efi
