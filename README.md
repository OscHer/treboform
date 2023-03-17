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

### Style guidelines used in this project

#### Aprovisionamiento
El [aprovisionamiento](https://developer.hashicorp.com/vagrant/docs/provisioning/basic_usage) se realiza en dos fases en este orden: *pre-aprovisionamiento* y aprovisionamiento propiamente dicho.

* **Pre-aprovisionamiento:** Dado que la infraestructura y sistema operativo puede variar. He preferido insertar una capa previa para preparar el entorno antes de aprovisionar mediante *Ansible*. De este modo no necesitamos tener Ansible instalado en el anfitrión y evitamos dependencias con repositorios para suscripción y similares.7
* **Aprovisionamiento:** Usaremos *[ansible local](https://developer.hashicorp.com/vagrant/docs/provisioning/ansible_local)* y, sin volvernos locos con la abstracción, trataremos de mantener un *[playbook](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html)* relativamente ordenado y escalable.

#### Código

He decidido usar valores por defecto en muchos de los archivos porque, aunque coincidan con el valor por defecto añade en comprensión del código especialmente a técnicos con poca experiencia en la tecnología en cuestión.

##### Backlog

Para no perder foco utilizaré un etiquetado en comentarios del código fuente para esas situaciones en las que te encuentras desarrollando y caes en la cuenta de que generas dependencias.
Con dejar un comentario con la siguiente sintaxis: `# TODO-oscar:` estaríamos generando una etiqueta susceptible de ser buscada mediante *[grep](https://www.man7.org/linux/man-pages/man1/grep.1.html)* y generar un texto con formato cercano a CSV.

#### Documentación

Generalmente uso un githook que obliga a escribir una línea en el [README.md](README.md) por cada cinco líneas de código: no me creo que 5 líneas de código cualesquiera (en positivo o en negativo) no merezcan al menos una mención de una línea en el README.md.
Al momento de la presente edición no lo he implementado en este proyecto por razones de simplicidad, pero si el tiempo o la deuda documental lo permiten, lo acabaré haciendo.

#### Git

Para facilitar filtrados en commits (por ejemplo git grep) y in caer [en lo barroco](https://www.conventionalcommits.org/en/v1.0.0/#specification) (por el momento)
he decidido usar el carácter 'C' delante de un commit con mensaje. De este modo, el project manager tiene a su disposición (¡JA!) la documentación tanto técnica
como funcional al alcance de la mano y así no tiene que madrugar para preguntar '¿cómo vas?'.

#### Vagrant
Antes de realizar cualquier commit tras una modificación del [Vagrantfile](Vagrantfile) he preferido realizar una comprobación completa con `vagrant destroy -f && vagrant up`. De este modo nos aseguramos una IaC más robusta y portable.

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
