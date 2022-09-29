#!/bin/sh -l

if [ -d "/github" ];then
    sudo chown -R build /github/workspace /github/home
fi

echo ${GPG_REPO_SEC} | tee -a ardentlinux_sec.gpg
echo ${TEMP_OWNER_TRUST} | tee -a trust-owner.txt

sudo pacman -Sy 
sudo pacman-key --init
sudo pacman-key --populate archlinux
wget https://raw.githubusercontent.com/atolycs/ardentlinux-keyring/master/ardentlinux.gpg
sudo pacman-key --add ./ardentlinux.gpg
gpg --import ./ardentlinux_sec.gpg
gpg --import ./ardentlinux.gpg
gpg --import-ownertrust ./trust-owner.txt
gpg --default-key ${TEMP_GPG_KEYFINGER_SEC}
gpg --list-keys

export GPGKEY=${TEMP_GPG_KEY}
ls -lsa

ls -1 *.pkg.tar.zst | while read line; do
    gpg --output "${line}.sig" --detach-sig "${line}"
done

repo-add -n --sign -k ${TEMP_GPG_KEY} ardent-staging.db.tar.xz *.pkg.tar.zst
repo-add -n --sign -k ${TEMP_GPG_KEY} ardent-stable.db.tar.xz *.pkg.tar.zst


echo "================"
echo "Package created:"
#echo `ls -lsa`
ls -lsa
echo "================"
