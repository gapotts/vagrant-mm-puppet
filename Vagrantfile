# -*- mode: ruby -*-
# vi: set ft=ruby :
 
# multiple Puppet Agent Nodes using YAML config file
# modified from original from Gary A. Stafford
# Changeed to read from YAML Greg Potts 03-31-2015
 
# read vm and chef configurations from YAML files
require 'yaml'
nodes_config = YAML.load_file('nodes.yaml')['nodes']
 
VAGRANTFILE_API_VERSION = "2"
 
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  nodes_config.each_pair do |vmname, vmspec |
 
    config.vm.define vmname do |config|
      config.vm.box = vmspec['box']
      # configures all forwarding ports in YAML array
      ports = vmspec['ports']
      ports.each do |port|
        config.vm.network :forwarded_port,
          host:  port['host'],
          guest: port['guest'],
          id:    port['id']
      end
 
      config.vm.hostname = vmname
      config.vm.network :private_network, ip: vmspec['ip']
 
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", vmspec['memory']]
        vb.customize ["modifyvm", :id, "--name", vmname]
      end
 
      config.vm.provision :shell, :path => vmspec['bootstrap']
    end
  end
end