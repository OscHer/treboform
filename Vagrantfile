# -*- mode: ruby -*-
# vi: set ft=ruby :

# TODO: using debian vagrant boxes creates a new dependency:
# you must use virtualbox and no other hypervisor technology.
# Study and refactor this.

# TODO: refactor initial VMs creation to a ruby array: https://community.ibm.com/community/user/cloud/blogs/stephan-bester/2022/07/05/use-vagrant-to-create-a-centos-environment-for-ans

BOX_IMAGE = "debian/testing64"

Vagrant.configure("2") do |config|

  # Trantor: Ansible controller node
  NODE="trantor"
  config.vm.define NODE, primary: true do |machine|
    machine.vm.box = BOX_IMAGE
    machine.vm.hostname = "trantor"

    # Set this node as our controller node
    machine.vm.provision :ansible_local do |ansible_local|
      ansible_local.playbook = "provision/ansible/vagrant_provision.yml"
      ansible_local.verbose = false
      ansible_local.install = true
      ansible_local.install_mode = :default # Install ansible from official repositories
      ansible_limit = "all"
      # TODO: create inventory from Vagrantfile
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
  end
end
