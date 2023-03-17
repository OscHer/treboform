# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_IMAGE = "debian/testing64"

Vagrant.configure("2") do |config|
  
  # Terminus: GLPI node
  NODE="terminus"
  config.vm.define NODE do |machine|
    machine.vm.box = BOX_IMAGE
    machine.vm.hostname = NODE
  end

  # Trantor: Ansible controller node
  NODE="trantor"
  config.vm.define NODE do |machine|
    machine.vm.box = BOX_IMAGE
    machine.vm.hostname = NODE
  end

end
