#!/bin/bash 

# Secondary Logging (SL)

# Script para habilitar y configurar secondary logging para todos los usuarios.
# Funcionará a modo de snap-in file para profile.d.
# Este mecanismo de monitorización y análisis forense no es insalvable
# pero añade una buena capa de seguridad.

# Defaults
SL_DIRECTORY="/var/log/sl" # Directorio que almacenará los logs de SL
SL_SCRIPT="/etc/profile.d/sl.sh" # Script que importaremos al iniciar una terminal de login
# TODO: considerar ponerlo en .bashrc para cubrir también sesiones sin login. 


[[ ! -d $SL_DIRECTORY ]] && mkdir -p $SL_DIRECTORY 2> /dev/null
