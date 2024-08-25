# Treboform

The present project consists of creating an encyclopedia that includes all the necessary knowledge
to create a Type III (in [Kardashev scale](https://en.wikipedia.org/wiki/Kardashev_scale)) galaxy-spanning civilization.

## Overview 

Main goal of this project is to provide minimal services I (and by ***I*** I mean ***me***) happen to consider essential
for a cloud IT environment.

## Dependencies

* [Vagrant](https://www.vagrantup.com)
* [Ansible](https://www.ansible.com)
* [Virtualbox](https://www.virtualbox.org/)
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
  1. Every node is provisioned using a [bootstrap](provision/preprovision/bootstrap.sh) script.
4. As a result we have a fully treboformed Type III Civilization and the magic begins.
 
### Assets
### VMs
Currently, our base box is [Ubuntu-22.04](https://ubuntu.com/download/server) in it's [bento/ubuntu-24.04](https://app.vagrantup.com/bento/boxes/ubuntu-24.04) instantiation.
There's a chance in the near future we build our own base image using Packer as stated in our [Roadmap](#Roadmap).

#### Topology
WIP

#### Managers
Manager nodes supply a centralized zone where sysadmin, auditors, DevSecOps can get raw information or give orders.

##### Anacreonte
**Anacreonte** is a provisional log collector node that, for the moment, just ingests logs and 
classifies them in a somehow logic way.

##### Horleggor
**Horleggor** is a developers' bastion. It'll serve as a development laboratory with some
code-monkey goodies.

##### Terminus: CMDB host
Every bit of knowledge of our infrastructure will be held here.

##### Trantor: Ansible controller node
**Trantor** will be our [Ansible control node](https://docs.ansible.com/ansible/latest/network/getting_started/basic_concepts.html). Our strategy consists in a centralized bastion
to launch our configuration manager to every other node in our galaxy (pun not intended, or is it?).


#### Users and groups
At this stage of the project two main zones are distinguished:
 - [Management nodes](#Managers)
 - Managed node

Since ansible adds the dependency of having a *sudoable* with *NOPASSWD* we have to deploy
our *ansible_user* prior to full unnatended management.

### Additional software
~~#### Secondary logging
Secondary logging is a bash based audit tool which logs every command executed in a shell
or subshell no matter if it's an interactive terminal or not.~~

~~At this moment will be deployed as a [shell script](provision/files/sl.sh) but in the future
it will work as an ansible role.~~

~~##### Statu Quo
Secondary logging is deployed into **/etc/profile.d/sl.sh** and sourced from **/etc/profile** in order to
be available for every user independently of his **bashrc**.~~

## Appendices

### Style guidelines
#### Metaproject
There will be metadocumentation and related info which not belongs to the project itself
but to to the experience gained while developing. That is a dossier you won't be giving
to your client but saving it for your team as jumpstart.
* meta/backlog.txt: grep-ped info from '# TODO' tags


#### Backlog

In order to help me focus in the coding part I've added some comments standards to solve those situations
when you're typing at a good pace and having to stop, even if it's only for a second, to add backlog is distracting.
So, comments like `# TODO-oscar: abstract this onto that` make a good balance between strict and easy. Plus, you can
parse them later with *[grep-like](https://www.man7.org/linux/man-pages/man1/grep.1.html)* tools and, even, create
a backlog.csv.

#### Git

Adding 'C' before a commit message allows us to filter with grep without being unnecessary [baroque](https://www.conventionalcommits.org/en/v1.0.0/#specification).

#### Alias
```
alias.s status -sb
alias.rp push origin HEAD
alias.visual !gitk & > /dev/null
alias.d diff --unified=0
alias.br branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate
alias.alias config --get-regexp ^alias.
alias.b branch
alias.l log -n 15 --graph --pretty=format:'%C(auto)%h%d%Creset%C(cyan)(%cr, %C(green)%an)%Creset %s'
alias.lg log -n 15 --graph --pretty=format:'%C(auto)%h%d%Creset%C(cyan)(%cr, %C(green)%an)%Creset %s' --all
```

#### Vagrant
Every time I've modified my main [Vagrantfile](https://developer.hashicorp.com/vagrant/docs/vagrantfile)
I've run a full test with `vagrant destroy -f && vagrant up` just to be sure.

##### Vagrant Plugins
* [Vagrant-hostmanager](https://developer.hashicorp.com/vagrant/docs/vagrantfile/vagrant_settings#config-vagrant-plugins)

### Concepts

* **Infrastructure:** Every layer or feature below any asset or functionality without which it couln't work. This must be understood as a relative term whatever SSMM influencers of the sacred brotherhood of standars say.
* **Managers:** A *manager* node is a server which main activity is to enable some capability for everyday management of the whole galaxy.
* **Secondary logging:** Extra layer of users activity monitoring.


### Roadmap

* [GLPI](https://glpi-project.org/) as CMDB
* [ELK](https://www.elastic.co/es/) as monitoring and alerting tool
    * [FreeIPA](https://www.freeipa.org)
* [Rsyslog](https://www.rsyslog.com/) collector.
    * [Secondary logging](provision/files/secondary/README.md)
    - Dedicated server
    - Standarized rsylog metrics
    - Standarized APM metrics
    - Standarized Python logs with [logging](https://docs.python.org/3/library/logging.html)
* Dotfiles
* [Packer](https://www.packer.io/) to create our own base images


