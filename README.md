# Treboform

The present project consists of creating an encyclopedia that includes all the necessary knowledge
to create a Type III (in [Kardashev scale](https://en.wikipedia.org/wiki/Kardashev_scale)) galaxy-spanning civilization.

## Description

Main goal of this project is to provide minimal services I (and by ***I*** I mean ***me***) happen to consider essential
for a cloud IT environment.

## Dependencies

* [Vagrant](https://www.vagrantup.com)
* [Ansible](https://www.ansible.com)
* [Virtualbox](https://www.virtualbox.org/): O [qemu](https://www.qemu.org) if you prefer
* [KVM/Libvirt](https://libvirt.org/drvqemu.html): this is optional too
* [Vim](https://www.vim.org/ "PERIOD!"). 

## Usage

### Setup
In your bash shell:
```bash
$ git clone https://github.com/OscHer/treboform
$ cd treboform
$ vagrant up && echo "He who controls the species controls the universe"
```

Right now, what's going on behind the scenes is:
1. Vagrant looks for the box somewhere in the local host.
2. If there's one, creates a VM; if not, vagrant looks for it in [its public repository](https://app.vagrantup.com/boxes/search).
3. Once the instantiated VM is up and running starts the provisioning process.
5. As a result we have a fully treboformed Type III Civilization and the magic begins.

## Appendices

### Style guidelines

#### Backlog

In order to help me focus in the coding part I've added some comments standards to solve those situations
when you're typing at a good pace and having to stop, even if it's only for a second, to add backlog is distracting.
So, comments like `# TODO-oscar: abstract this onto that` make a good balance between strict and easy. Plus, you can
parse them later with *[grep-like](https://www.man7.org/linux/man-pages/man1/grep.1.html)* tools and, even, create
a backlog.csv.

#### Git

Adding 'C' before a commit message allows us to filter with grep without being unnecessary [baroque](https://www.conventionalcommits.org/en/v1.0.0/#specification).

#### Vagrant
Every time I've modified my main [Vagrantfile](https://developer.hashicorp.com/vagrant/docs/vagrantfile) I've run a full test with `vagrant destroy -f && vagrant up`.

### Conceptos

* **Infraestructura:** Cualquier capa o componente situado por debajo de las máquinas virtuales. Por ejemplo: Vagrant, KVM/Libvirt, etc... Debe entenderse como un término relativo digan lo que digan los influencers del código.
* **Metadocumentación:** La metadocumentación es un término usado para englobar toda aquella documentación, conocimiento, experiencia, trucos, etc... asociados al aprendizaje durante la ejecución del proyecto. Para entendernos: cuando terminas un proyecto y sale a producción (Y ESTO IMPLICA HABER TERMINADO LA DOCUMENTACIÓN PORQUE FORMA PARTE DEL PROYECTO) se le entrega al cliente la carpetita con el manual que nunca leerá pero queda genial en una estantería. Las cosas tipo "Los rebase están dando problemas en arquitecturas multilenguaje así que decidimos NO-SE-QUE" forman parte de una metadocumentación que los gurús estos de agile jamás mencionan.
* **Pre-aprovisionamiento:** Requisitos previos antes de realizar un aprovisionamiento. Por ejemplo: si queremos usar *[ansible_local](https://developer.hashicorp.com/vagrant/docs/provisioning/ansible_local)* necesitaremos que en los nodos estén los correspondientes repositorios habilitados.

### Roadmap
* secondary logging 
* añadir dotfiles
* colector rsyslog
* Stack ELK para cocinado, indexado y auditado de logs
* Sistema de alertado basado en ELK
