FROM archlinux:base
RUN pacman -Syu --needed --noconfirm \
    binutils \
    fakeroot \
    grep \
    namcap \
    pacman-contrib \
    sudo \
    git 

RUN useradd -d /build -m build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER build
WORKDIR /build

COPY entrypoint.sh /entrypoint.sh
#COPY makepkg_custom.conf /etc/makepkg.conf
ENTRYPOINT ["/entrypoint.sh"]
