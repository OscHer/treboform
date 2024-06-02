# -*- mode: ruby -*-
# vi: set ft=ruby :

# TODO: using debian vagrant boxes creates a new dependency:
# you must use virtualbox and no other hypervisor technology.
# Study and refactor this.

# TODO: refactor initial VMs creation to a ruby array: https://community.ibm.com/community/user/cloud/blogs/stephan-bester/2022/07/05/use-vagrant-to-create-a-centos-environment-for-ans

BOX_IMAGE = "debian/testing64"

Vagrant.configure("2") do |config|

  config.vm.box_check_update = false

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
    end
  end

end
