# Treboform

Este proyecto gestionará la treboformación de servidores GNU/Linux.
Vagrant es accesorio y solo para probar si funcionan los despliegues.

## Dependencias

* [Vagrant](https://www.vagrantup.com)
* [Ansible](https://www.ansible.com): Solo para despliegues. Siéntete libre de saltártelo.
* [Virtualbox](https://www.virtualbox.org/): O KVM si lo prefieres.
* [KVM/Libvirt](https://libvirt.org/drvqemu.html): También opcional como motor de virtualización.
* [Vim](https://www.vim.org/ "PERIOD!"). 

## Instrucciones de uso

Una vez tenemos las dependencias de más arriba satisfechas ejecutamos en nuestro terminal:
```bash
$ git clone https://github.com/OscHer/treboform
$ cd treboform
$ vagrant up && echo "He who controls the species controls the universe"
```

## Información genérica

## Apéndices

### Estilo

#### Código

He decidido usar valores por defecto en muchos de los archivos porque, aunque coincidan con el valor por defecto añade en comprensión del código especialmente a técnicos con poca experiencia en la tecnología en cuestión.

#### Documentación

#### Git

#### Vagrant
Antes de realizar cualquier commit tras una modificación del [Vagrantfile](Vagrantfile) he preferido realizar una comprobación completa con `vagrant destroy -f && vagrant up`. De este modo nos aseguramos una IaC más robusta y portable.

##### Aprovisionamiento
El [aprovisionamiento](https://developer.hashicorp.com/vagrant/docs/provisioning/basic_usage) se realiza en dos fases en este orden: *pre-aprovisionamiento* y aprovisionamiento propiamente dicho.

* **Pre-aprovisionamiento:** Dado que la infraestructura y sistema operativo puede variar. He preferido insertar una capa previa para preparar el entorno antes de aprovisionar mediante *Ansible*. De este modo no necesitamos tener Ansible instalado en el anfitrión y evitamos dependencias con repositorios para suscripción y similares.7
* **Aprovisionamiento:** Usaremos *[ansible local](https://developer.hashicorp.com/vagrant/docs/provisioning/ansible_local)* y, sin volvernos locos con la abstracción, trataremos de mantener un *[playbook](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html)* relativamente ordenado y escalable.

### Conceptos

* **Infraestructura:** Cualquier capa o componente situado por debajo de las máquinas virtuales. Por ejemplo: Vagrant, KVM/Libvirt, etc... Debe entenderse como un término relativo digan lo que digan los influencers del código.
