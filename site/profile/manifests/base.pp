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




$ssh_permit_root_login = hiera('ssh::permit_root_login')
$sshd_x11_forwarding = hiera('ssh::sshd_x11_forwarding')
$sshd_config_permitemptypasswords = hiera('ssh::sshd_config_permitemptypasswords')
$sshd_config_permituserenvironment = hiera('ssh::sshd_config_permituserenvironment')
$sshd_client_alive_interval = hiera('ssh::sshd_client_alive_interval')
$sshd_config_login_grace_time = hiera('ssh::sshd_config_login_grace_time')
$sshd_config_banner = hiera('ssh::sshd_config_banner') 
$sshd_banner_content = hiera('ssh::sshd_banner_content')

$accounts_users = hiera_hash('accounts::users',{})
$accounts_usergroups = hiera_hash('accounts::usergroups',{})
$accounts_account = hiera_hash('accounts::account',{})


  class {'::accounts':
    users => $accounts_users,
    groups => $accounts_usergroups,
    accounts => $accounts_account,
  }
  class {'::ssh':
    permit_root_login => $ssh_permit_root_login,
    sshd_x11_forwarding => $sshd_x11_forwarding,
    sshd_config_permitemptypasswords => $sshd_config_permitemptypasswords,
    sshd_config_permituserenvironment => $sshd_config_permituserenvironment,
    sshd_client_alive_interval => $sshd_client_alive_interval,
    sshd_config_login_grace_time => $sshd_config_login_grace_time,
    sshd_config_banner => $sshd_config_banner,
    sshd_banner_content => $sshd_banner_content
  }

}

