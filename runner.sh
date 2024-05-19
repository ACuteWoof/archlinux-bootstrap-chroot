sudo chown -R codespace /workspaces/archlinux-bootstrap-chroot/root.x86_64
sudo ./mount.sh << EOF
cd ~/iso-profile
git pull
sudo ./build.sh
EOF
./upload.sh