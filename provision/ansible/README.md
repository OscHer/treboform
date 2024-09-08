# Ansible as main Treboformer technology

My main strategy to provision every node in our galaxy is
to use [Vagrant](https://www.vagrantup.com) task to infrastructure
creation in the first stages of the whole process.
So we only need our Ansible bastion **Trantor** as a hard dependency and
our only high level provisioner can be fed by a synced folder over
whatever technology we prefer ([NFS](https://developer.hashicorp.com/vagrant/docs/synced-folders/nfs), [Virtualbox shared folders](https://developer.hashicorp.com/vagrant/docs/synced-folders/virtualbox), [rsync](https://developer.hashicorp.com/vagrant/docs/synced-folders/rsync), etc...)

## Resources
* **[provision/ansible/](.):**  YOU ARE HERE
