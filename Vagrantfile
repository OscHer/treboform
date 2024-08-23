# -*- mode: ruby -*-
# vi: set ft=ruby :


# Project variables
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
      :ip   => "192.168.56.10",
      :qxl_port => 5910
    },
    {
      :name => "terminus",
      :box  => BASE_IMAGE,
      :ip   => "192.168.56.11",
      :qxl_port => 5911
    },
    {
      :name => "anacreon",
      :box  => BASE_IMAGE,
      :ip   => "192.168.56.12",
      :qxl_port => 5912
    },
    {
      :name => "horleggor",
      :box  => BASE_IMAGE,
      :ip   => "192.168.56.13",
      :qxl_port => 5913
    }
  ]

  boxes.each do |opts|
    config.vm.define opts[:name] do |subconfig|
      subconfig.vm.box      = opts[:box]
      subconfig.vm.hostname = opts[:hostname]

      # VNC section
      subconfig.vm.provider :libvirt do |libvirt|
        libvirt.graphics_port = opts[:qxl_port]
        libvirt.graphics_ip   = '0.0.0.0'
        libvirt.video_type    = 'qxl'
      end

      # We aim to reduce our infrastructure dependencies so, our
      # provisioning strategy is a self-deploying bastion which,
      # after self provisioning, it runs ansible playbooks to every
      # other node in our cloud.
      if opts[:name] == "trantor"
        subconfig.vm.provision "bootstrap", type: :shell, path: "provision/shell/bootstrap.sh"
      end
    end
  end
end
