# test
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include test
class test {

  case fact('osfamily') {
    'windows': {
      $path = 'C:\file'
      $link = 'C:\link'
    }
    'RedHat': {
      $path = '/etc/file'
      $link = '/etc/link'
    }
  }

  ini_setting { 'test':
    ensure  => present,
    path    => $path,
    section => 'main',
    setting => 'test',
    value   => 'value'
  }

  file { $link:
    ensure => symlink,
    target => $path,
  }

}
