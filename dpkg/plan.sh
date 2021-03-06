pkg_name=dpkg
pkg_origin=core
pkg_version=1.18.9
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('GPL-2.0')
pkg_upstream_url=https://wiki.debian.org/dpkg
pkg_description="dpkg is a package manager for Debian-based systems"
pkg_source=http://http.debian.net/debian/pool/main/d/${pkg_name}/${pkg_name}_${pkg_version}.tar.xz
pkg_shasum=86ac4af917e9e75eb9b6c947a0a11439d1de32f72237413f7ddab17f77082093
pkg_deps=(
  core/bzip2
  core/glibc
  core/tar
  core/zlib
  core/xz
)
pkg_build_deps=(
  core/autoconf
  core/automake
  core/bzip2
  core/gcc
  core/gettext
  core/libtool
  core/make
  core/ncurses
  core/perl
  core/pkg-config
  core/xz
  core/zlib
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
