# Download and extract
echo -e "\033[1;92mDownloading Bootstrap Gzip\033[0m"
curl -lO https://geo.mirror.pkgbuild.com/iso/2024.05.01/archlinux-bootstrap-x86_64.tar.zst
echo -e "\033[1;92mExtracting Bootstrap Gzip\033[0m"
tar -I zstd -xvf ./archlinux-bootstrap-*-x86_64.tar*

# Update mirrorlist for Arch Linux
echo -e "\033[1;92mUpdating Mirror List\033[0m"
sed -i 's/#S/S/g' ./root.x86_64/etc/pacman.d/mirrorlist
# Mounting stuff
echo -e "\033[1;92mRunning mount --bind on ./root.x86_64\033[0m"
mount --bind ./root.x86_64 ./root.x86_64

# Chroot into the Arch install
echo -e "\033[1;92mChrooting into the Arch install\033[0m"
./root.x86_64/bin/arch-chroot ./root.x86_64 << "EOT"
	pacman-key --init
	pacman-key --populate archlinux
	pacman -Syyu --noconfirm
	pacman -S base-devel --needed git --noconfirm
	pacman -S archiso --noconfirm
EOT

