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
  config.vm.box = "centos-6.6-x86_64"
 
  nodes_config.each_pair do |vmname, vmspec |
    node_name   = vmname # name of node
    node_values = vmspec # content of node
 
    config.vm.define node_name do |config|
      # configures all forwarding ports in JSON array
      ports = node_values['ports']
      ports.each do |port|
        config.vm.network :forwarded_port,
          host:  port['host'],
          guest: port['guest'],
          id:    port['id']
      end
 
      config.vm.hostname = node_name
      config.vm.network :private_network, ip: node_values['ip']
 
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", node_values['memory']]
        vb.customize ["modifyvm", :id, "--name", node_name]
      end
 
      #config.vm.provision :shell, :path => node_values[':bootstrap']
    end
  end
end