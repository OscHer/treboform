#!/bin/bash 

# Script de pre-aprovisionamiento para el entorno Treboform.
# Va destinado a resolver dependencias previas al aprovisionamiento como tal desde Ansible
# y aumentar la portabilidad del entorno.

# No interactivo pero de verdad.
# Apt no pregunta cuando añades "-y", pero dpkg sí. 
# man dpkg
upgrade_without_asking()
{
  DEBIAN_FRONTEND=noninteractive \
  apt-get \
  -o Dpkg::Options::="--force-confnew" \
  -fuy \
  dist-upgrade
}

apt-get update # Actualizar repositorios
upgrade_without_asking
