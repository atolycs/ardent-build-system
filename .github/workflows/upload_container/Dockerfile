FROM archlinux:base
RUN pacman -Syu --needed --noconfirm \
    binutils \
    fakeroot \
    grep \
    namcap \
    pacman-contrib \
    sudo \
    git \
    make \
    wget 

RUN useradd -d /build -m build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN pacman-key --init
#RUN pacman-key --populate archlinux
#RUN pacman-key --refresh-keys

USER build
WORKDIR /build

COPY entrypoint.sh /entrypoint.sh
#COPY makepkg_custom.conf /etc/makepkg.conf
ENTRYPOINT ["/entrypoint.sh"]
