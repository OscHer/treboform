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
  config.vm.define NODE, primary: true do |machine|
    machine.vm.box = BOX_IMAGE
    machine.vm.hostname = NODE

    # Set this node as our controller node
    machine.vm.provision :ansible_local do |ansible_local|
      ansible_local.playbook = "provision/ansible/playbook.yml"
      ansible_local.verbose = true
      ansible_local.install = true
      ansible_local.install_mode = :default # Install ansible from official repositories
      ansible_limit = "all"
      # TODO: create inventory from Vagrantfile
    end
  end

end
