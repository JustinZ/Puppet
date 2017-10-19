#Default role
class role::devops_host {
  include profile::base 
  include profile::mysql   
  include profile::nginx   
  include profile::sftp  
}
