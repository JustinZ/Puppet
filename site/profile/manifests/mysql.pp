class profile::mysql {
include '::mysql::server'
mysql::db { 'ENC_hosts':
  user     => 'justin',
  password => 'digital1',
  host     => 'localhost',
  grant    => ['ALL'],
  #sql      => '/home/justin/puppet_classification_db.sql',
  #import_timeout => 900,
}
}