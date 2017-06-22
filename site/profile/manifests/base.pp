class profile::base {
#variables definitions
  class { '::selinux':
#old design without hiera    mode => disabled,   
    mode => $selinux_mode
    }
class {'::sudo':} 
  sudo::conf {'wheel':
    content => "%wheel ALL=(ALL) NOPASSWD: ALL",
  }
  sudo::conf {'rbackup':
    content => "  Defaults:rbackup !requiretty
rbackup ALL = NOPASSWD: /usr/bin/rsync"}
class { '::ntp':
  servers => [ '0.pool.ntp.org', '1.pool.ntp.org' ],
}
}

