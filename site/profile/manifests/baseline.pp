class profile::baseline {
  include profile::baseline::motd
  contain profile::baseline::hosts
  contain profile::baseline::ssh
  include profile::baseline::packages
  #include profile::baseline::sudo
  include profile::baseline::ntp
  include profile::baseline::path
  #include profile::baseline::vim
  #include profile::baseline::users
  include profile::puppet::agent
  include profile::baseline::selinux
  Class['profile::baseline::hosts'] -> Class['profile::baseline::ssh']  
}
