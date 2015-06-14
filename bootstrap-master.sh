#! /bin/sh

rpm -qa | grep puppetlabs || sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
if [ $( rpm -qa | grep puppet- > /dev/null ) ]; then
  if [ $( puppet --version ) \< "3.6.0" ]; then
    sudo yum update puppet -y
  fi
else
  sudo yum install puppet -y
fi

sudo puppet module install stahnma-epel
sudo puppet apply /vagrant/common.pp

sudo puppet module install theforeman-puppet
#sudo puppet module install stephenrjohnson-puppet
sudo puppet module install zack/r10k
sudo puppet module install puppet/puppetdb

sudo puppet apply /vagrant/bootstrap-master.pp

sudo r10k deploy environment -pv
