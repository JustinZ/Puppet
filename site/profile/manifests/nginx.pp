class profile::nginx {
class { 'nginx': }
nginx::resource::server { "${fqdn}":
  www_root => "/var/www/${fqdn}",
}
class index {
"/var/www/${fqdn}/index.html":content => "Hello World";  
}
}