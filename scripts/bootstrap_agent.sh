#!/bin/bash
role=$1
server_name=$2
master_ip=$4
master_host=$5

function setup_networking {
  echo "$server_name" > /etc/hostname
  hostname $server_name
  echo "127.0.0.1 $server_name localhost.localdomain localhost" > /etc/hosts
  echo "$master_ip $master_host puppet" >> /etc/hosts
}

function install_prereqs {
  apt -y install curl
}

function install_poss_puppetagent {
  sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
  sudo yum -y install puppet-agent
  sudo echo '[agent]' >> /etc/puppetlabs/puppet/puppet.conf
  sudo echo "server = puppet" >> /etc/puppetlabs/puppet/puppet.conf
  sudo cat > /etc/puppetlabs/puppet/csr_attributes.yaml << YAML
extension_requests:
    pp_role:  $role
YAML

  sudo service puppet start
}

function install_pe_puppetagent {
  sudo mkdir -p /etc/puppetlabs/puppet
  sudo echo '[agent]' >> /etc/puppetlabs/puppet/puppet.conf
  sudo echo "server = puppet" >> /etc/puppetlabs/puppet/puppet.conf
  sudo cat > /etc/puppetlabs/puppet/csr_attributes.yaml << YAML
extension_requests:
    pp_role:  $role
YAML
  curl -k https://puppet:8140/packages/current/install.bash | sudo bash
  sudo service puppet start
}

setup_networking
install_prereqs
install_pe_puppetagent
