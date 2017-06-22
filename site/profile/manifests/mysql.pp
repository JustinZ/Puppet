class profile::mysql {
include '::mysql::server'
mysql::db { 'ENC_hosts':
  user     => 'justin',
  password => '$1$xx$3CfaGhl7ktDkSY.ENv0iD.',
  host     => 'localhost',
  grant    => ['ALL'],
  sql      => '/home/justin/puppet_classification_db.sql',
  import_timeout => 900,
}
}