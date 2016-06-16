pkg_origin=sdmouton
pkg_name=jenkins-war
pkg_version=2.9
pkg_maintainer="Shaun Mouton <sdmouton@devops.christmas>"
pkg_license=()
pkg_source=http://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${pkg_version}/${pkg_filename}
pkg_filename=${pkg_name}-${pkg_version}.war
pkg_shasum=a2fa588244f82ee82ba8951a9611629109bd35a63ce48d15dae7c925c2da0a51
pkg_deps=(core/server-jre adufour/apache-tomcat)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_expose=(8080 50000)

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
