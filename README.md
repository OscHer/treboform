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
4. As a result we have a fully treboformed Type III Civilization and the magic begins.

### Assets
#### Trantor: Ansible controller node
**Trantor** will be our [Ansible control node](https://docs.ansible.com/ansible/latest/network/getting_started/basic_concepts.html). Our strategy consists in a centralized bastion
to launch our configuration manager to every other node in our galaxy (not pun intended, or is it?).

During the Vagrantfile provisioning, ansible is installed with *:default* mode; that is: from official repositories.
After Ansible is installed on this node, Trantor starts treboforming the rest of the galaxy no matter how far away
the other nodes are because... wait for it... ANSIBLE!!!!

#### Terminus: CMDB host
Every bit of knowledge of our infrastructure will be held here.

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

### Concepts

* **Infrastructure:** Every layer or feature below any asset or functionality without which it couln't work. This must be understood as a relative term whatever SSMM influencers of the sacred brotherhood of standars say.

### Roadmap
* Secondary logging
* [GLPI](https://glpi-project.org/) as CMDB
* [ELK](https://www.elastic.co/es/) as monitoring and alerting tool
* [Rsyslog](https://www.rsyslog.com/) collector.
    - Dedicated server
    - Standarized rsylog metrics
    - Standarized APM metrics
    - Standarized Python logs with [logging](https://docs.python.org/3/library/logging.html)
* Dotfiles
