#!/bin/sh -l

if [ -d "/github" ];then
    sudo chown -R build /github/workspace /github/home
fi
WORK_DIR="$(pwd)"

echo "${WORK_DIR}"
ls -lsa

sudo pacman -Sy

export MAKEFLAGS=-j$(nproc)
ls -1 ${WORK_DIR} | while read line;
do
    cd ${WORK_DIR}/${line}
    namcap PKGBUILD
    makepkg -fC --syncdeps --noconfirm
    mv *.pkg.tar.zst ../
done

echo "================"
echo "Package created:"
echo `ls *.pkg.tar.zst`
echo "================"
