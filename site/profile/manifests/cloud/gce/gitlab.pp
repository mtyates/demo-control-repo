class profile::cloud::gce::gitlab {
  gce_instance { 'gitlab-01':
    ensure         => present,
    zone           => 'us-central1-f',
    image          => 'centos-7',
    machine_type   => 'n1-standard-1',
    startup_script => 'bootstrap_agent.sh'
  }
}
