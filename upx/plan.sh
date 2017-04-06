pkg_name=upx
pkg_origin=core
pkg_version=3.93
pkg_license=('GPL')
pkg_description="The Ultimate Packer for eXecutables"
pkg_upstream_url="https://upx.github.io/"
pkg_source=https://github.com/upx/upx/releases/download/v${pkg_version}/${pkg_name}-${pkg_version}-src.tar.xz
pkg_shasum=893f1cf1580c8f0048a4d328474cb81d1a9bf9844410d2fd99f518ca41141007
pkg_deps=()
pkg_build_deps=(
  core/make
  core/gcc
  core/coreutils
  core/ucl
  core/zlib
)

do_prepare() {
  export LDFLAGS="$LDFLAGS -static"
  pkg_dirname="${pkg_name}-${pkg_version}-src"
}

do_build() {
  # disable this whitespace script which is throwing errors
  rm -f src/stub/scripts/check_whitespace.sh \
    && touch src/stub/scripts/check_whitespace.sh \
    && chmod 755 src/stub/scripts/check_whitespace.sh
  make all
}

do_install() {
  mkdir -p $pkg_prefix/bin/
  cp -a src/upx.out $pkg_prefix/bin/upx
}
