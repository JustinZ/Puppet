class profile::base {
#variables definitions
  class { selinux:
    mode => disabled,
    }
}
