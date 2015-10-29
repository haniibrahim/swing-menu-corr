#!/bin/bash

# 'swing-menu-corr' emends the following bugs appearing by using Java
# apps with Swing GTK theme:
# 
# - missing menu border
# - wrong font color of activated checkbox and radiobutton menu items
# - no menu separators
# 
# in Linux Mint 17.x. 
# 
# This script changes entries of the 'menus.rc' file in all 'themes'
# directories of '/usr/share/themes/[mint-theme]/gtk-2.o/styles'.
# 
# 'swing-menu-corr' creates backup files as 'menus.rc.original' in every
# directory before changing the original files. To undo the change use 'swing-menu-undo.sh'.
# 
# Refer http://blog.hani-ibrahim.de/swing-menus-gtk-laf.html for details.
# 
# Author: Hani Ibrahim <hani.ibrahim@gmx.de>
# License: GNU Public License 2.0
#
# ======================================================================
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Dieses Programm ist Freie Software: Sie können es unter den Bedingungen
# der GNU General Public License, wie von der Free Software Foundation,
# Version 3 der Lizenz oder (nach Ihrer Wahl) jeder neueren
# veröffentlichten Version, weiterverbreiten und/oder modifizieren.
#
# Dieses Programm wird in der Hoffnung, dass es nützlich sein wird, aber
# OHNE JEDE GEWÄHRLEISTUNG, bereitgestellt; sogar ohne die implizite
# Gewährleistung der MARKTFÄHIGKEIT oder EIGNUNG FÜR EINEN BESTIMMTEN ZWECK.
# Siehe die GNU General Public License für weitere Details.
#
# Sie sollten eine Kopie der GNU General Public License zusammen mit diesem
# Programm erhalten haben. Wenn nicht, siehe <http://www.gnu.org/licenses/>.

# Target directory
dir="/usr/share/themes"
#dir=/home/hi/Schreibtisch/themes #test environment


# Check for root permission
if [ `id -u` -ne 0 ]
then 
	echo 'ERROR: Please use "sudo" to run this script with root permission' 1>&2
	exit -101
fi

echo "'swing-menu-corr' emends the following bugs appearing by using Java
apps with Swing GTK theme:

- missing menu border
- wrong font color of activated checkbox and radiobutton menu items
- no menu separators

in Linux Mint 17.x. 

This script changes entries of the 'menus.rc' file in all 'themes'
directories of '/usr/share/themes/[mint-theme]/gtk-2.0/styles'.

'swing-menu-corr' creates backup files as 'menus.rc.original' in every
directory before changing the original files. To undo the change use 'swing-menu-undo.sh'.

Refer http://blog.hani-ibrahim.de/swing-menus-gtk-laf.html for details.

Author: Hani Ibrahim <hani.ibrahim@gmx.de>
License: GNU Public License 2.0
"

echo "Do you want to proceed? [Y/n]"
read -sn 1 ans
if [[ ! -z $ans ]] && !([[ $ans == "Y" ]] || [[ $ans == "y" ]]); then
	echo "Process cancelled"	
	exit 0
fi 


# Create safety copies with ".original" suffix as long as 
# no .original files are present (prevents overwriting the 
# original configuration in the backup files by rerunning the script. 
find $dir -name "menus.rc" -exec bash -c 'if [ ! -f {}.original ];then cp {} {}.original ; fi' \;

# Change to the appropriate settings in menus.rc for correct 
# displayed Swing menus.
find $dir -name "menus.rc" -print | xargs sed -i -e 42c"\    xthickness = 1 # Changed by swing-menu-corr.sh" -e 43c"\    ythickness = 1 # Changed by swing-menu-corr.sh" -e 53c"\    fg[ACTIVE] = @fg_color # Changed by swing-menu-corr.sh" -e 103c"\    ythickness = 1 # Changed by swing-menu-corr.sh" && echo "Successfully finished"
