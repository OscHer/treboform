# Treboform

Este proyecto gestionará la treboformación de servidores GNU/Linux.
Vagrant es accesorio y solo para probar si funcionan los despliegues.

## Dependencias

* [Vagrant](https://www.vagrantup.com)
* [Ansible](https://www.ansible.com): Solo para despliegues. Siéntete libre de saltártelo.
* [Virtualbox](https://www.virtualbox.org/): O KVM si lo prefieres.
* [KVM/Libvirt](https://libvirt.org/drvqemu.html): También opcional como motor de virtualización.
* [Vim](https://www.vim.org/ "PERIOD!"). 

## Infraestructura

Gestionaremos la infraestructura con [Vagrant](https://www.vagrantup.com/) y usaremos aprovisionadores y automatismos con [Ansible](https://en.wikipedia.org/wiki/Ansible "Ender knew, Ursula") siempre que sea posible.



## Apéndices

### Conceptos

* **Infraestructura:** Cualquier capa o componente situado por debajo de las máquinas virtuales. Por ejemplo: Vagrant, KVM/Libvirt, etc... Debe entenderse como un término relativo digan lo que digan los influencers del código.
