class profile::puppet::consoleusers {
  rbac_user { 'deploy':
    ensure       => 'present',
    name         => 'deploy',
    display_name => 'deployment user account',
    email        => 'matthew.yates@puppet.com',
    password     => 'puppetlabs',
    roles        => [ 'Code Deployers', 'Operators', 'Viewers' ],
  }
}
