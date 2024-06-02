# -*- mode: ruby -*-
# vi: set ft=ruby :

# TODO: using debian vagrant boxes creates a new dependency:
# you must use virtualbox and no other hypervisor technology.
# Study and refactor this.


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


  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.box = opts[:box]
      config.vm.hostname = opts[:name]
    end
  end

end
