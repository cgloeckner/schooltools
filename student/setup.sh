#!/bin/bash

LOGON=/home/schueler/.logon.sh

# create logon script
MOUNT="#!/bin/bash\n\ngio mount smb://$1/ausgabe --anonymous\ngio mount smb://$1/einsammeln --anonymous"
echo "${MOUNT}" > ${LOGON}

# add logon script to autostart
echo ".${LOGON}" >> ~/.bashrc

# prepare openssh server for remote access
sudo apt-get install openssh-server

