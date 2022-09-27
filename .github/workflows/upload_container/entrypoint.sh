#!/bin/sh -l

if [ -d "/github" ];then
    sudo chown -R build /github/workspace /github/home
fi
sudo pacman -Sy 

ls -lsa
repo-add -n --sign  ardent-repo.db.tar.xz *.pkg.tar.zst
    

echo "================"
echo "Package created:"
#echo `ls -lsa`
ls -lsa
echo "================"
