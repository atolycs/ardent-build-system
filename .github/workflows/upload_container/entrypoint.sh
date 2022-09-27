#!/bin/sh -l

if [ -d "/github" ];then
    sudo chown -R build /github/workspace /github/home
fi
sudo pacman -Sy 

if [ -d "./x86_64" ];then
    mkdir -p "./x86_64"
fi

repo-add -k ardent-repo.db.tar.xz *.pkg.tar.zst
mv *-x86_64.pkg.tar.zst{,.sig} ./x86_64/
mv *-any.pkg.tar.zst{,.sig} ./x86_64/
mv ardent-repo.* ./x86_64/

echo "================"
echo "Package created:"
echo `ls ./x86_64/`
echo "================"
