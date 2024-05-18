# Mounting stuff
echo -e "\033[1;92mRunning mount --bind on ./root.x86_64\033[0m"
mount --bind ./root.x86_64 ./root.x86_64
# Chrooting
echo -e "\033[1;92mChrooting into ./root.x86_64\033[0m"
./root.x86_64/bin/arch-chroot ./root.x86_64

