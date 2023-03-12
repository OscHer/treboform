# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/testing64" # Nuestra imagen base para el entorno
  config.vm.hostname = "paul" # :D

  # Configuración y valores por defecto
  config.vm.allow_fstab_modification = true  # Puntos de montaje desde infra.
  config.vm.allow_hosts_modification = true # Resolución de nombres local en /etc/hosts
  config.vm.post_up_message = "Remember: Walk without rhythm and we won't attract the worm." # Now makes sense, isn't it?
  config.vm.synced_folder ".", "/vagrant", disabled: false # Redundamos el directorio compartido por defecto. Lo necesitamos para ansible_local

  # Aprovisionamiento
  # Pre-aprovisionamiento mediante shell script. Ver README.md
  config.vm.provision "preprovision", type: "shell", path: "provision/shell/preprovision.sh"

  # Aprovisionamiento declarativo 
  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "provision/ansible/playbook.yml"
  end 

end
