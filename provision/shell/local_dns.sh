#!/usr/bin/env bash

######################################################################
# @author      : Óscar Heredia (65867332+OscHer@users.noreply.github.com)
# @file        : local_dns.sh
# @created     : domingo sep 15, 2024 17:40:58 CEST
#
# @description : Populate /etc/host based on ansible inventory 
######################################################################

INVENTORY_FILE="/vagrant/provision/ansible/inventory"
AWK_BIN=$(which awk)

[[ -x "$AWK_BIN" ]] || echo "awk bin not found"
[[ -f /vagrant/provision/ansible/inventory ]] || echo "Inventory file not found"

echo "" >> /etc/hosts
echo "# Treboform" >> /etc/hosts
$AWK_BIN -F' ansible_host=' '/ansible_host/ {print $2, $1}' $INVENTORY_FILE | uniq >> /etc/hosts
