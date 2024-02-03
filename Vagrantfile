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

    # Temporary synced folder for development purposes
    # TODO: change this into a specific ansible role for installing secondary logging
    machine.vm.synced_folder "provision/files/secondary/", "/etc/profile.d/"

    # Set this node as our controller node
    machine.vm.provision :ansible_local do |ansible_local|
      ansible_local.playbook = "provision/ansible/playbook.yml"
      #ansible_local.verbose = true
      ansible_local.install = true
      ansible_local.install_mode = :default # Install ansible from official repositories
      ansible_limit = "all"
      # TODO: create inventory from Vagrantfile
    end
  end


  # Anacreonte: Provisional log collector.
  #  - secondary logging
  NODE="Anacreonte"
  config.vm.define NODE do |machine|
    machine.vm.box = BOX_IMAGE
    machine.vm.hostname = NODE 
    
    # machine.vm.network "private_network", ip: "192.168.56.2"
  
    # Temporary synced folder for development purposes
    # TODO: change this provision to Ansible provisioning with templates. Divide and conquer if needed
    machine.vm.synced_folder "provision/files/secondary/server/profile.d", "/etc/profile.d/"
    machine.vm.synced_folder "provision/files/secondary/server/rsyslog.d", "/etc/rsyslog.d/"
    
    # Set this node as our controller node
    machine.vm.provision :ansible_local do |ansible_local|
      ansible_local.playbook = "provision/ansible/playbook.yml"
      #ansible_local.verbose = true
      ansible_local.install = true
      ansible_local.install_mode = :default # Install ansible from official repositories
      ansible_limit = "all"
    end
  end

 #Roshar: Tester for the secondary log
  NODE="Roshar"
  config.vm.define NODE do |machine|
    machine.vm.box = BOX_IMAGE
    machine.vm.hostname = NODE
     
    machine.vm.network "private_network", ip: "192.168.56.3"
  
  # Temporary synced folder for development purposes
    machine.vm.synced_folder "provision/files/secondary/client/profile.d", "/etc/profile.d/"
    machine.vm.synced_folder "provision/files/secondary/client/rsyslog.d", "/etc/rsyslog.d/"

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
