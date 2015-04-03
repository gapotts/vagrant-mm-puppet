#! /bin/sh

rpm -qa | grep puppetlabs || sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
rpm -qa | grep puppet- || sudo yum install puppet -y

sudo puppet module install stahnma-epel
sudo puppet apply /vagrant/common.pp

sudo puppet module install stephenrjohnson-puppet
sudo puppet module install zack/r10k

sudo puppet apply /vagrant/bootstrap-master.pp

sudo r10k deploy environment -pv