#! /bin/sh

sudo puppet module install stahnma-epel
sudo puppet module install stephenrjohnson-puppet
sudo puppet apply -e "include epel"
sudo puppet apply -e "class{'puppet::repo::puppetlabs': }"
sudo puppet apply -e "class { 'puppet::master': environments => 'directory', }"
sudo puppet apply -e "package { 'git': ensure => present, }"