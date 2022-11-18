#!/bin/sh -l

if [ -d "/github" ];then
    sudo chown -R build /github/workspace /github/home
fi

#export GPG_TTY=$(tty)
echo "${ATOLYCS_PASSPHRASE}" | base64 --decode
echo -n "${PACK_PRIVATE_PGP_KEY}" | base64 --decode | gpg --batch --import --passphrase "$(echo ${ATOLYCS_PASSPHRASE} | base64 --decode)"
#gpg --import keys.gpg --passphrase $(cat atolycs_pass.txt)
echo "${KEY_TRUST_MODE}" | base64 --decode | gpg --import-ownertrust
# --passphrase "${ATOLYCS_PASSPHRASE}"
#echo "${TEMP_OWNER_TRUST}" | tee -a trust-owner.txt

sudo pacman -Sy 
#gpg --import-ownertrust ./trust-owner.txt
gpg --list-keys

ls -lsa

if [ ! -z "${build_arch}" ];then
    cd ${build_arch}
fi

ls -1 *.pkg.tar.zst | while read line; do
    gpg -u ${SIGHN_OWNER} --output "${line}.sig" --detach-sig "${line}"
done

if [[ ! -z "${_repos}" ]];then
    case "${_repos}" in
        "staging") repo-add -n --sign ardent-staging.db.tar.xz *.pkg.tar.zst;;
        "stable") repo-add -n --sign ardent-stable.db.tar.xz *.pkg.tar.zst;;
    esac
fi

#repo-add -n --sign ardent-staging.db.tar.xz *.pkg.tar.zst
#repo-add -n --sign ardent-stable.db.tar.xz *.pkg.tar.zst


echo "================"
echo "Package created:"
#echo `ls -lsa`
ls -lsa
echo "================"
