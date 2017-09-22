# test
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include test
class test {

  $path = fact('osfamily') ? {
    'windows' => 'C:\test',
    'RedHat'  => '/etc/test',
  }

  ini_setting { 'test':
    ensure  => present,
    path    => $path,
    section => 'main',
    setting => 'test',
    value   => 'value'
  }

}
