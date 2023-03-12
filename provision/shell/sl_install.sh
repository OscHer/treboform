#!/bin/bash 

# Instalación de secondary logging

ORIGIN="/tmp/sl.sh"
DESTINATION="/etc/profile.d/sl.sh" # De esta forma es más discreto
SL_DIRECTORY="/var/log/sl/"

mv -f $ORIGIN $DESTINATION && echo "SL movido con éxito"
chown root:root $DESTINATION && echo "SL instalado con éxito"
# TODO: eliminar archivo en directorio temporal $ORIGIN

# Creamos directorio de logs y añadimos permisos adicionales
[[ ! -d $SL_DIRECTORY ]] && mkdir -p $SL_DIRECTORY 2> /dev/null
chmod o+w $SL_DIRECTORY
chmod +t $SL_DIRECTORY # Queremos el sticky bit para evitar borrados  # TODO: considerar generar directorios por usuario y apligar SGID
