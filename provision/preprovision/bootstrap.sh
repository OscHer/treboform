#!/bin/bash 

# This is a bootstrap script to solve some dependencies when
# in 'vagrant up' stage. Since every GNU/Linux box already comes
# with bash (or other shell interpreter) adding ansible or more
# complicated provisioners just adds complexity when not needed.
#
# This means: vagrant up should not be relying (or at least try
# to minimize dependencies) on host OS.

#Crea
