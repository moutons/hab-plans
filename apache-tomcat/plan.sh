pkg_origin=adufour
pkg_name=apache-tomcat
pkg_version=8.0.36
pkg_maintainer="Andrew Dufour <adufour@chef.io>"
pkg_license=()
pkg_source=http://apachemirror.ovidiudan.com/tomcat/tomcat-8/v${pkg_version}/bin/${pkg_name}-${pkg_version}.tar.gz
pkg_filename=${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=7963464d86faf8416b92fb2b04c70da9759c7c332e1700c1e9f581883b4db664
pkg_deps=(core/glibc core/server-jre)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_expose=(8080)

do_build() {
  return 0
}

do_install() {
  build_line "Copying files from $PWD"
  JAVA_HOME=$(pkg_path_for core/server-jre)
  mkdir -p $pkg_prefix
  cp -r * $pkg_prefix
  build_line "Setting JAVA_HOME: $JAVA_HOME"
  echo $JAVA_HOME > $pkg_prefix/JAVA_HOME
}
