# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/testing64" # Nuestra imagen base para el entorno
  config.vm.hostname = "paul" # :D

  # Configuración y valores por defecto
  config.vm.allow_fstab_modification = true  # Puntos de montaje desde infra.
  config.vm.allow_hosts_modification = true # Resolución de nombres local en /etc/hosts
  config.vm.post_up_message = "Remember: Walk without rhythm and we won't attract the worm." # Now makes sense, isn't it?
  config.vm.synced_folder ".", "/vagrant", disabled: true # Desactivamos el directorio compartido por defecto. Así evitamos sustos.

  # Aprovisionamiento
  config.vm.provision "preprovision", type: "shell", path: "provision/preprovision.sh"  
end
