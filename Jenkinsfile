node {
    stage ('Checkout Control Repo') {
      git url: 'https://github.com/velocity303/demo-control-repo.git', branch: 'production'
    }

    stage ('Check Style') {
      sh 'echo $(find . -type f -name "*.pp" \\( -exec /opt/puppetlabs/puppet/bin/puppet-lint --with-filename {} \\; -o -quit \\) 2>&1 ) | grep -v ERROR'
    }

    stage ('Check Syntax') {
      sh 'echo $(find . -type f -name "*.pp" \\( -exec /opt/puppetlabs/bin/puppet parser validate {} \\; -o -quit \\) 2>&1 ) | grep -v Error'
    }

    stage ('Authorize deployment') {
      puppet.credentials 'pe-access-token'
    }
    stage ('Deploy to production') {
      puppet.codeDeploy 'production'
    }

    stage ('Deploy change to production') {
      puppet.job 'production', query: 'nodes { catalog_environment = "production" }' 
    }
}
