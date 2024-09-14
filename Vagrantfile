# -*- mode: ruby -*-
# vi: set ft=ruby :

# TODO-oscar: abstract global variables using external files using plugins like :
# https://github.com/maoueh/nugrant or https://github.com/gosuri/vagrant-env

# Project variables
BASE_IMAGE = "bento/ubuntu-24.04"


Vagrant.configure("2") do |config|
  # Required plugins
  #config.vagrant.plugins = ["vagrant-host-shell"]

  # Common BASE_IMAGE but not exclusive since we can
  # modify our inventory array. See below.
  config.vm.box = BASE_IMAGE

  # TODO-oscar: add checksum for the vagrant box
  # TODO-oscar: change this into a yaml and reuse it for other scripts: https://stackoverflow.com/questions/16708917/how-do-i-include-variables-in-my-vagrantfile
  # Provisional CMDB
  boxes = [
    {
      :hostname => "terminus",
      :box  => BASE_IMAGE,
      :ip   => "192.168.56.11",
      :qxl_port => 5911
    },
    {
      :hostname => "anacreon",
      :box  => BASE_IMAGE,
      :ip   => "192.168.56.12",
      :qxl_port => 5912
    },
    {
      :hostname => "horleggor",
      :box  => BASE_IMAGE,
      :ip   => "192.168.56.13",
      :qxl_port => 5913
    }
  ]

  managers = [
    {
      :hostname => "trantor",
      :box  => BASE_IMAGE,
      :ip   => "192.168.56.10",
      :qxl_port => 5910
    }
  ]

  # TODO-oscar: generate after boot metrics and sync them at a low level layer with host being collector
  # Global synced folder. Only high level and common tasks. WIP
  config.vm.synced_folder "collector/", "/vagrant", type: "nfs", version: 4, nfs_udp: false

  # Disable default synced folder since it breaks trantor provisioning
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Iterate over each machine while initializing every particular attribute
  boxes.each do |opts|
    config.vm.define opts[:hostname] do |subconfig|
      subconfig.vm.box              = opts[:box]
      subconfig.vm.hostname         = opts[:hostname]
      subconfig.vm.box_check_update = true # We don't want automated upgrades of vagrant boxes
      subconfig.vm.network :private_network, ip: opts[:ip]

      # Specific Libvirt vars
      subconfig.vm.provider :libvirt do |libvirt|
        libvirt.graphics_port = opts[:qxl_port]
        libvirt.graphics_ip   = '0.0.0.0'
        libvirt.video_type    = 'qxl'
      end

      # TODO-oscar: give some more info when sayin' hi: OS, hardware, etc...
      subconfig.vm.provision "imalive", type: :shell, path: "provision/shell/imalive.sh"
    end
  end

  # We aim to reduce our infrastructure dependencies so our  provisioning strategy is a 
  # self-deploying bastion intended to serve as our main ansible controller node
  managers.each do |opts|
    config.vm.define opts[:hostname] do |subconfig|
      subconfig.vm.box              = opts[:box]
      subconfig.vm.hostname         = opts[:hostname]
      subconfig.vm.box_check_update = true # We don't want automated upgrades of vagrant boxes
      subconfig.vm.network :private_network, ip: opts[:ip]

      # Specific Libvirt vars
      subconfig.vm.provider :libvirt do |libvirt|
        libvirt.graphics_port = opts[:qxl_port]
        libvirt.graphics_ip   = '0.0.0.0'
        libvirt.video_type    = 'qxl'
      end

      # TODO-oscar: give some more info when sayin' hi: OS, hardware, etc...
      subconfig.vm.provision "imalive", type: :shell, path: "provision/shell/imalive.sh"
      # Generate ansible inventory
      # TODO-oscar: abstract path into a variable
      subconfig.vm.provision "shell" do |s|
        s.inline = <<-SHELL
          rm -f /vagrant/provision/ansible/inventory
          echo "[all]" >> /vagrant/provision/ansible/inventory
        SHELL
  
        boxes.each do |box|
          s.inline += <<-SHELL
            echo "#{box[:hostname]} ansible_host=#{box[:ip]}" >> /vagrant/provision/ansible/inventory
          SHELL
        end
  
        s.inline += <<-SHELL
          echo "" >> /vagrant/provision/ansible/inventory
          echo "[trantor]" >> /vagrant/provision/ansible/inventory
          echo "trantor ansible_host=#{managers.find { |b| b[:hostname] == 'trantor' }[:ip]}" >> /vagrant/provision/ansible/inventory
        SHELL
      end
    end

    # TODO-oscar: change these paths into variables for a better scalability.
    #config.vm.provision "bootstrap", type: :shell, path: "provision/shell/bootstrap.sh"

    # Sync our ansible dependencies into trantor and only trantor
    config.vm.synced_folder "provision/ansible/", "/vagrant/provision/ansible/", type: "nfs", version: 4, nfs_udp: false
  end
end
