pkg_origin=adufour
pkg_name=sample-war
pkg_version=8.0.36
pkg_maintainer="Andrew Dufour <adufour@chef.io>"
pkg_license=()
pkg_source=https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/sample.war
pkg_filename=sample.war
pkg_shasum=89b33caa5bf4cfd235f060c396cb1a5acb2734a1366db325676f48c5f5ed92e5
pkg_deps=(core/server-jre adufour/apache-tomcat)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_build() {
  return 0
}

do_unpack() {
  return 0
}

do_install() {
  export CATALINA_HOME=$(pkg_path_for adufour/apache-tomcat)
  export JAVA_HOME=$(pkg_path_for core/server-jre)
  build_line "Deploying war file"
  cp -r $HAB_CACHE_SRC_PATH/$pkg_filename $CATALINA_HOME/webapps
  echo $JAVA_HOME > $pkg_prefix/JAVA_HOME
  echo $CATALINA_HOME > $pkg_prefix/CATALINA_HOME
}
