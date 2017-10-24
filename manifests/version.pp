# comments
define test::version (
  Enum['absent','present'] $ensure = 'present',
) {

  package { 'java':
    ensure => $ensure,
  }

}
