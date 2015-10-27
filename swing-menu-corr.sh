#!/bin/bash

# Target directory
dir="/usr/share/themes"

# Check for Mint
dist=`lsb_release -i`

# Check for "Zenity"
if [ -z `which zenity` ]
then
	zen=0
else
	zen=1
fi

# Check for root permission
if [ `id -u` -ne 0 ]
then 
	echo 'ERROR: Please use "sudo" to run this script with root permission' 1>&2
	exit -101
fi

