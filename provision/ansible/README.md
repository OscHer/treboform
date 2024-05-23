# Ansible provisioning

Main provision of this project is made with ansible-plabook in a declarative and
idempotent way.

## Roles
* [vim](roles/vim): Install Vim and some plugins.
* [git](roles/git): Install Git and [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt)
* [baseapps](roles/baseapps): Install desired application considered imprescindible by me.
* [diaspora](roles/diaspora): Create users and groups for each node in our galaxy with its own requisites.

