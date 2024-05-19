#!/bin/sh

echo -e "\033[1;92mUploading ISO to server\033[0m"
scp -i /workspaces/archlinux-bootstrap-chroot/ignore/ssh-key-2024-05-06-oracle-main-stockholm.key /workspaces/archlinux-bootstrap-chroot/root.x86_64/root/iso-profile/out/woofos-$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)-x86_64.iso ubuntu@lewoof.xyz:/home/ubuntu/store/woof-os/dl
echo -e "\033[1;92mCreating symlink in server\033[0m"
ssh -i /workspaces/archlinux-bootstrap-chroot/ignore/ssh-key-2024-05-06-oracle-main-stockholm.key -t '/home/ubuntu/store/woof-os/dl/autolink.sh'