pkg_name=zeromq-musl
pkg_distname=zeromq
pkg_origin=core
pkg_version=4.1.4
pkg_license=('LGPL')
pkg_source=http://download.zeromq.org/${pkg_distname}-${pkg_version}.tar.gz
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_shasum=e99f44fde25c2e4cb84ce440f87ca7d3fe3271c2b8cfbc67d55e4de25e6fe378
pkg_deps=(core/libsodium-musl)
pkg_build_deps=(
  chetan/gcc-musl core/coreutils core/make
  core/libsodium-musl core/pkg-config core/diffutil
)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)


do_prepare() {
  # dynamic_linker="$(pkg_path_for musl)/lib/ld-musl-x86_64.so.1"
  # LDFLAGS="$LDFLAGS -Wl,--dynamic-linker=$dynamic_linker"

  # remove /musl/ from flags
  # see c++ notes in faq https://www.musl-libc.org/faq.html
  local flags=$(echo $CFLAGS | tr ' ' '\n' | grep -v /musl/ | tr '\n' ' ')
  CFLAGS="$flags"
  CXXFLAGS="$flags"
  CPPFLAGS="$flags"
}

do_build() {
  # ./configure --prefix="$pkg_prefix" \
  PKG_CONFIG="pkg-config --libs" ./configure --prefix="$pkg_prefix" \
              --host x86_64-linux-musl \
              --with-libsodium
              # --enable-static \
              # --disable-shared
  echo $CFLAGS
  make
}

do_install() {
  do_default_install
  find $pkg_prefix/lib -name *.so | xargs -I '%' patchelf --set-rpath "$LD_RUN_PATH" %
}
