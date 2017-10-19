 class profile::sftp {
$ssh_sshd_config_match = hiera_hash('ssh::sshd_config_match',{})
$dir_list = hiera_hash('chroot::dir_list',{})
$sftp_folders_list = hiera_hash('sftp_folders::folders',{})

  class {'::chroot_ssh':
    folders => $sftp_folders_list
  }
}
