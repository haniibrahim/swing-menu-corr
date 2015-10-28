#!/bin/bash

# Target directory
#dir="/usr/share/themes"
dir=/home/hi/Schreibtisch/themes

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
#if [ `id -u` -ne 0 ]
#then 
#	echo 'ERROR: Please use "sudo" to run this script with root permission' 1>&2
#	exit -101
#fi

echo "'swing-menu-corr' emends the following bugs appearing by using Java
apps with Swing GTK theme:

- missing menu border
- wrong font color of activated checkbox and radiobutton menu items
- no menu separators

in Linux Mint 17.x. 

This script changes entries of the 'menus.rc' file in all 'themes'
directories of '/usr/share/themes/[mint-theme]/gtk-2.o/styles'.

'swing-menu-corr' creates backup files as 'menus.rc.original' in every
directory before changing the original files.

Refer http://www.microchip.com/forums/m844821.aspx what this script does for details.

Author: Hani Ibrahim <hani.ibrahim@gmx.de>
License: GNU Public License 2.0
"

echo "Do you want to proceed? [Y/n]"
read -sn 1 ans
if [[ $ans = "n" ]] || [[ $ans = "N" ]]; then
	echo "Process cancelled"	
	exit 0
fi 


# Create safety copies with ".original" suffix
find $dir -name "menus.rc" -exec cp {} {}.original \;

# Change the appropriate settings in menus.rc.
find $dir -name "menus.rc" -print | xargs sed -i -e 42c"\    xthickness = 1 # Changed by swing-menu-corr.sh" -e 43c"\    ythickness = 1 # Changed by swing-menu-corr.sh" -e 53c"\    fg[ACTIVE] = @fg_color # Changed by swing-menu-corr.sh" -e 103c"\    ythickness = 1 # Changed by swing-menu-corr.sh"
