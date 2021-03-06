class profile::app::jboss_helloworld (
  $source = 'https://s3-us-west-2.amazonaws.com/tseteam/files/jboss-helloworld.war'
) {
  class { 'java':
    distribution => 'jdk',
  }->

  class { 'wildfly':
    java_home => $::java_default_home,
  }->

  wildfly::deployment { 'jboss-helloworld.war':
    source    => $source,
  }
}
