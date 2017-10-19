class profile::nginx {
    $fooacl_permissons = 'user:justin:rwX'
class { 'nginx': }
nginx::resource::server { "${fqdn}":
  www_root => "/var/www/${fqdn}",
}
file {"/var/www":
ensure  => directory,  
}
file {"/var/www/${fqdn}":
ensure  => directory,  
}
file {"/var/www/${fqdn}/index.html":
ensure  => present,  
content => "Hello World",  
}
fooacl::conf { '${fqdn}':
  target      => '/var/www/${fqdn}',
  permissions => [
  '$fooacl_permissons',
  ],
}
}