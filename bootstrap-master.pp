class { 'puppet::master':
  environments => 'directory',
} ->

package { 'gcc':
  ensure => installed,
} ->

package {'system_timer':
  ensure   => installed,
  provider => gem,
} ->

class { 'r10k':
  sources => {
    'puppet'  => {
    'remote'  => 'https://github.com/gapotts/r10k-ctl-mmpup.git',
    'basedir' => "${::settings::confdir}/environments",
    'prefix'  => false,
    }
  },
  purgedirs => ["${::settings::confdir}/environments"],
  manage_modulepath => false,
}