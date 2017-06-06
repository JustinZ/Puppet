class profile::base {
#variables definitions
  class { selinux:
    mode => disabled,
    }
class {'::sudo':} 
  sudo::conf {'wheel':
    content => "%wheel ALL=(ALL) NOPASSWD: ALL",
  }
  sudo::conf {'rbackup':
    content => "Defaults:rbackup !requiretty
rbackup ALL = NOPASSWD: /usr/bin/rsync"}
}

