#!/bin/bash 

# Instalación de secondary logging

ORIGIN="/tmp/sl.sh"
DESTINATION="/etc/profile.d/sl.sh" # De esta forma es más discreto

mv -f $ORIGIN $DESTINATION && echo "SL movido con éxito"
chown root:root $DESTINATION && echo "SL instalado con éxito"
# TODO: eliminar archivo en directorio temporal $ORIGIN
