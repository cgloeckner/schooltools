#!/bin/bash

TEACHER=/home/lehrer/Ausgabe
STUDENT=/home/lehrer/Einsammeln

SMB_CONF=/etc/samba/smb.conf
SMB_SHARES=/etc/samba/shares.conf

# install samba
sudo apt-get install samba

# setup directories
mkdir ${TEACHER}
mkdir ${STUDENT}
mkdir ${SOFTWARE}
chmod o=rwx ${STUDENT}

# prepare samba share config
AUSGABE="[Ausgabe]\npath = ${TEACHER}\nread only = yes\nguest ok = yes"
EINSAMMELN="[Einsammeln]\npath = ${STUDENT}\nwritable = yes\nguest ok=yes"
INSTALLER="[Software]\npath = /var/cache/apt/archives\nread only = yes\nguest ok = yes" 
echo -e "${AUSGABE}\n\n${EINSAMMELN}\n\n${INSTALLER}" | sudo tee -a ${SMB_SHARES} > /dev/null

# add shares to samba and restart it
echo "include = ${SMB_SHARES}" | sudo tee -a ${SMB_CONF} > /dev/null
sudo service smbd restart

