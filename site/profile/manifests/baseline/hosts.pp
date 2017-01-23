class profile::baseline::hosts {
  if $::trusted['extensions']['pp_role'] == 'puppetmaster' {
    class  { '::hosts':
      collect_all           => true,
      purge_hosts           => true,
      enable_ipv6_localhost => false,
      fqdn_host_aliases     => [$::hostname, 'puppet'],
    }

  }
  else {
    class  { '::hosts':
      collect_all           => true,
      purge_hosts           => false,
      enable_ipv6_localhost => false,
    }
  }
}
