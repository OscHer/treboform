# -*- mode: ruby -*-
# vi: set ft=ruby :

# TODO: using debian vagrant boxes creates a new dependency:
# you must use virtualbox and no other hypervisor technology.
# Study and refactor this.


BOX_IMAGE = "debian/testing64"

Vagrant.configure("2") do |config|

  # Trantor: Ansible controller node
  NODE="trantor"
  config.vm.define NODE, primary: true do |machine|
    machine.vm.box = BOX_IMAGE
    machine.vm.hostname = "trantor"

<<<<<<< Updated upstream
    # Set this node as our controller node
    machine.vm.provision :ansible_local do |ansible_local|
      ansible_local.playbook = "provision/ansible/playbook.yml"
      #ansible_local.verbose = true
      ansible_local.install = true
      ansible_local.install_mode = :default # Install ansible from official repositories
      ansible_limit = "all"
      # TODO: create inventory from Vagrantfile
=======
  # Better abstraction and more like a CMDB inventory
  boxes = [
    {
      :name => "trantor",
      :box => BOX_IMAGE 
    },
    {
      :name => "terminus",
      :box => BOX_IMAGE
    },
    {
      :name => "anacreonte",
      :box => BOX_IMAGE 
    }
  ]

  # Iterate over each asset and do your magic
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.box = opts[:box]
      config.vm.hostname = opts[:name]

      config.vm.provision :shell, path: "provision/preprovision/bootstrap.sh"
>>>>>>> Stashed changes
    end
  end

  # Terminus: GLPI node
  NODE="terminus"
  config.vm.define NODE do |machine|
    machine.vm.box = BOX_IMAGE
    machine.vm.hostname = "terminus"
  end

  # Anacreonte: Provisional log collector.
  NODE="anacreonte"
  config.vm.define NODE do |machine|
    machine.vm.box = BOX_IMAGE
    machine.vm.hostname = "anacreonte"
    
    # Set this node as our controller node
    machine.vm.provision :ansible_local do |ansible_local|
      ansible_local.playbook = "provision/ansible/playbook.yml"
      #ansible_local.verbose = true
      ansible_local.install = true
      ansible_local.install_mode = :default # Install ansible from official repositories
      ansible_limit = "all"
    end
  end
end
