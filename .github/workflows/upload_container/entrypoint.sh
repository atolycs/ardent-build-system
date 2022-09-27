#!/bin/sh -l

if [ -d "/github" ];then
    sudo chown -R build /github/workspace /github/home
fi
sudo pacman -Sy 

ls -lsa

repo-add -k ardent-repo.db.tar.xz ./ardent-repos/*.pkg.tar.zst

echo "================"
echo "Package created:"
echo `ls ./x86_64/`
echo "================"
