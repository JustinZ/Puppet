class profile::nginx {
class { 'nginx': }
nginx::resource::server { "${fqdn}":
  www_root => "/var/www/${fqdn}",
}
file {"/var/www/${fqdn}":
ensure  => present,  
content => "Hello World",  
}
}