# -*- mode: ruby -*-
# vi: set ft=ruby :

BASE_IMAGE = "bento/ubuntu-24.04"

Vagrant.configure("2") do |config|
  # Common BASE_IMAGE but not exclusive since we can
  # modify our inventory array. See below.
  config.vm.box = BASE_IMAGE

  # Provisional CMDB
  boxes = [
    {
      :name => "trantor",
      :box  => BASE_IMAGE,
      :ip   => "192.168.56.10"
    },
    {
      :name => "terminus",
      :box  => BASE_IMAGE,
      :ip   => "192.168.56.11"
    },
    {
      :name => "anacreon",
      :box  => BASE_IMAGE,
      :ip   => "192.168.56.12"
    },
    {
      :name => "horleggor",
      :box  => BASE_IMAGE,
      :ip   => "192.168.56.13"
    }
  ]

  boxes.each do |opts|
    config.vm.define opts[:name] do |subconfig|
      subconfig.vm.box      = opts[:box]
      subconfig.vm.hostname = opts[:hostname]
    end
  end
end
