#!/bin/bash

sudo mkdir /mnt/software
sudo mount -t cifs -o username=guest //$1/Software /mnt/software
sudo cp /mnt/software/*.deb /var/cache/apt/archives
sudo umount /mnt/software

sudo apt-get install $2

