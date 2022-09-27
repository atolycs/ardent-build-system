# Maintainer: Atolycs <win8.kagamine.len@gmail.com>

pkgname=ardentlinux-mirrorlist
pkgver=20220927
pkgrel=1
pkgdesc='ArdentLinux repository mirrorlists'
arch=('any')
source=("ardentlinux-mirror")
sha256sums=('SKIP')
package() {
    cd "${srcdir}"
    install -Dm644 "${srcdir}/ardentlinux-mirror" "${pkgdir}/etc/pacman.d/ardentlinux-mirror"
}
