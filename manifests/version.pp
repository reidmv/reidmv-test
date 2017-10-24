# comments
define test::version(
  Enum['absent','present'] $ensure               = 'present',
  Optional[String]         $base_installdir      = undef,
  Optional[String]         $windows_path_symlink = undef,
) {

  if $::osfamily == 'Windows' {
    $package_ensure = $ensure

    $installdir = $base_installdir ? {
      undef   => 'd:/apps/productdir',
      default => $base_installdir,
    }

    validate_absolute_path($installdir)

    $safe_name = regsubst($name, ' ', '_')
    $log_file = "D:\\java-${safe_name}.log"

    $package_install_options = ["INSTALLDIR=\"${installdir}\"", '/L*V', "\"${log_file}\""]

    if $windows_path_symlink {

      validate_absolute_path($windows_path_symlink)

      $link_ensure = $package_ensure ? {
        'absent' => 'absent',
        default  => 'link',
      }

      file { $windows_path_symlink:
        ensure => $link_ensure,
        target => $installdir,
        force  => true,
      }
    }
  } else {
    $package_ensure = $ensure
    $package_install_options = []
  }

  package { 'java' :
    ensure          => $package_ensure,
    install_options => $package_install_options
  }
}
