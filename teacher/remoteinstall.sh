#!/bin/bash

sudo apt-get $2 --download-only

ssh lehrer@$1 "./remoteinstall.sh $1 $2"

