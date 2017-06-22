class profile::mysql {
include '::mysql::server'
mysql::db { 'ENC_hosts':
  user     => 'justin',
  password => '$1$Fid45cI9$EoV5Nyft0QhLdZSqpdJSo1',
  host     => 'localhost',
  grant    => ['ALL'],
}
}