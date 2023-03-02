# Treboform

Este proyecto gestionará la treboformación de servidores GNU/Linux.
Vagrant es accesorio y solo para probar si funcionan los despliegues.

## Dependencias

* [Vagrant](https://www.vagrantup.com)
* [Ansible](https://www.ansible.com): Solo para despliegues. Siéntete libre de saltártelo.
* [Virtualbox](https://www.virtualbox.org/): O KVM si lo prefieres.
* [KVM/Libvirt](https://libvirt.org/drvqemu.html): También opcional como motor de virtualización.
* [Vim](https://www.vim.org/ "PERIOD!"). 

## Información genérica

## Apéndices

### Estilo

#### Código

He decidido usar valores por defecto en muchos de los archivos porque, aunque coincidan con el valor por defecto añade en comprensión del código especialmente a técnicos con poca experiencia en la tecnología en cuestión.

#### Documentación

#### Git

### Vagrant
Antes de realizar cualquier commit tras una modificación del [Vagrantfile](Vagrantfile) he preferido realizar una comprobación completa con `vagrant destroy -f && vagrant up`. De este modo nos aseguramos una IaC más robusta y portable.

### Conceptos

* **Infraestructura:** Cualquier capa o componente situado por debajo de las máquinas virtuales. Por ejemplo: Vagrant, KVM/Libvirt, etc... Debe entenderse como un término relativo digan lo que digan los influencers del código.
