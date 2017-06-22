node 'puppet'{
  include role::puppet_server
}
node 'node1'{
  include role::devops_host
}
