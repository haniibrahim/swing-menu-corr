#!/bin/bash

# 'swing-menu-undo' reverts the changes of 'swing-menu-corr.sh'
# by moving the backupfiles 'menus.rc.original' to 'menus.rc'
# in all 'themes' directories of 
# '/usr/share/themes/[mint-theme]/gtk-2.0/styles' if possible.
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


# Current version
version="1.2.2"

# Target directory
dir="/usr/share/themes"
#dir=/home/hi/Schreibtisch/themes #test environment

# Output version
if [[ $1 == "--version" ]] || [[ $1 == "-V" ]]
then 
	echo $version ; 
	exit
fi

# Help
if [[ $1 == "--help" ]]
then
	echo "USAGE: sudo ./swing-menu-undo.sh [OPTION...]
Undo the changes of 'swing-menu-corr.sh'

 OPTIONS:
      --help         this page
  -V, --version      version output

 EXAMPLES
  sudo ./swing-menu-undo.sh
  ./swing-menu-undo.sh --version"
	exit
fi


# Check for root permission
if [ `id -u` -ne 0 ]
then 
	echo 'ERROR: Please use "sudo" to run this script with root permission' 1>&2
	exit -101
fi

echo "'swing-menu-undo' reverts the changes of 'swing-menu-corr.sh'
by moving the backupfiles 'menus.rc.original' to 'menus.rc'
in all 'themes' directories of 
'/usr/share/themes/[mint-theme]/gtk-2.0/styles' if possible.

Refer http://blog.hani-ibrahim.de/swing-menus-gtk-laf.html for details.
 
Author: Hani Ibrahim <hani.ibrahim@gmx.de>
License: GNU Public License 2.0
"

echo "Do you want to proceed? [Y/n]"
read -sn 1 ans
if [[ ! -z $ans ]] &&  !([[ $ans == "Y" ]] || [[ $ans == "y" ]]); then
	echo "Process cancelled"	
	exit 0
fi

# Move all menus.rc.original files to menus.rc
find $dir -type f -name "menus.rc.original" -exec bash -c 'mv {} $(dirname {})/menus.rc' \; && echo "Successfully finished. You need to rerun your Java application(s) if already running"

mv /usr/share/themes/Adwaita/gtk-2.0/gtkrc.original /usr/share/themes/Adwaita/gtk-2.0/gtkrc
