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


# TODO: introducir todo esto en una función
# TODO: una linea por entrada, eliminar esos comentarios
# TODO: estandarizar el formato para rsyslog
# TODO: integrar con journald
# TODO-chavo: YA CÁLLATE, CÁLLATE, CÁLLATE!!! QUE ME DESESPERAS!!
_who_am_i=$(who am i|awk '{print $1}')
_ID=$(id -u $_who_am_i)

if [ "$_ID" > 0 ]
then
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export HISTFILE=$SL_DIRECTORY/sl-$(who am i | awk '{print $1}';exit)-$(date +%F)
export PROMPT_COMMAND='history -a'
fi
