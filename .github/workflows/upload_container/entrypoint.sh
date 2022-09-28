#!/bin/sh -l

if [ -d "/github" ];then
    sudo chown -R build /github/workspace /github/home
fi
sudo pacman -Sy 

sudo pacman-key --init
sudo pacman-key --populate archlinux
wget https://raw.githubusercontent.com/atolycs/ardentlinux-keyring/master/ardentlinux.gpg
sudo pacman-key --add ./ardentlinux.gpg


ls -lsa
repo-add -n --sign  ardent-repo.db.tar.xz *.pkg.tar.zst
    

echo "================"
echo "Package created:"
#echo `ls -lsa`
ls -lsa
echo "================"
