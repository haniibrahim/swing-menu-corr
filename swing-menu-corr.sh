#!/bin/bash

# 'swing-menu-corr' emends the following bugs appearing by using Java
# apps with Swing GTK theme:
# 
# - missing menu border
# - wrong font color of activated checkbox and radiobutton menu items
# - no menu separators
# 
# in Linux Mint 17.x, 18.x and 19.x. 
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

# Current Version
version="1.2.3"

# Target directory
dir="/usr/share/themes"

# Output version
if [[ $1 == "--version" ]] || [[ $1 == "-V" ]]
then 
	echo $version ; 
	exit
fi 

# Help
if [[ $1 == "--help" ]]
then
	echo "USAGE: sudo ./swing-menu-corr.sh [OPTION...]
Corrects some graphical issues regarding the menu in Java's Swing GTK-LookAndFeel in Linux Mint

 OPTIONS:
      --help         this page
  -V, --version      version output

 EXAMPLES:
  sudo ./swing-menu-corr.sh
  ./swing-menu-corr.sh --version

To undo the changes of this script use the script 'swing-menu-undo.sh' in this ditribution"
	exit
fi

# Check for root permission
if [ `id -u` -ne 0 ]
then 
	echo 'ERROR: Please use "sudo" to run this script with root permission' 1>&2
	exit -101
fi
# ----------------------------
echo "'swing-menu-corr' emends the following bugs when using Java
apps with Swing GTK theme:

- missing menu border
- wrong font color of activated checkbox and radiobutton menu items
- no menu separators

in Linux Mint 17.x/18.x/19.x. This script changes entries of the 'menus.rc' files 
in all Mint theme directories and the 'gtkrc' file of the Adwaita theme.

'swing-menu-corr' creates backup files '*.original' in every
directory before changing the original files. To undo the changes use 
'swing-menu-undo.sh'.

Refer http://blog.hani-ibrahim.de/swing-menus-gtk-laf.html for details.

Author: Hani Ibrahim <hani.ibrahim@gmx.de>
License: GNU Public License 3.0
"

echo "Do you want to proceed? [Y/n]"
read -sn 1 ans
if [[ ! -z $ans ]] && !([[ $ans == "Y" ]] || [[ $ans == "y" ]]); then
	echo "Process cancelled"	
	exit 0
fi 

# Check, whether Mint 17.x/18.x/19.x is used or not
mint=1  # "mint=1" means Mint 17.x/18.x(19.x) is used 
if ! lsb_release -i >/dev/null 2>&1; then # Not all Distros have "lsb_release"
	echo "You do not use Linux Mint at all."
	mint=0
fi
if [ $mint -eq 1 ]; then

	if [[ "`lsb_release -i`" != *Mint* ]]; then
		echo "You do not use Linux Mint."
		mint=0
	fi
	if [[ "`lsb_release -r`" != *17* ]] && [[ "`lsb_release -r`" != *18* ]] && [[ "`lsb_release -r`" != *19* ]]; then
		echo "You do not use Linux Mint Release 17.x, 18.x or 19.x."
		mint=0
	fi
fi
if [ $mint -eq 0 ]; then # When Mint checking fails
	echo "Do you REALLY want to proceed? [y/N]"
	read -sn 1 ans
	if [ "$ans" != "y" -a "$ans" != "Y" ]; then
		echo "Process cancelled"	
		exit 0
	fi
fi
# -------------------------------------------
# Create safety copies of menus.rc and gtkrc with ".original" suffix 
# as long as no .original files are present (prevents overwriting the 
# original configuration in the backup files by rerunning the script. 
find $dir -name "menus.rc" -exec bash -c 'if [ ! -f {}.original ];then cp {} {}.original ; fi' \;
if  [ ! -f /usr/share/themes/Adwaita/gtk-2.0/gtkrc.original ]; then cp /usr/share/themes/Adwaita/gtk-2.0/gtkrc /usr/share/themes/Adwaita/gtk-2.0/gtkrc.original ; fi
# -------------------------------------------
# Change to the appropriate settings in menus.rc for correct 
# displayed Swing menus. In this line the magic takes place :-)
find $dir -name "menus.rc" -print | xargs sed -i -e 42c"\    xthickness = 1 # Changed by swing-menu-corr.sh" -e 43c"\    ythickness = 1 # Changed by swing-menu-corr.sh" -e 53c"\    fg[ACTIVE] = @fg_color # Changed by swing-menu-corr.sh" -e 103c"\    ythickness = 1 # Changed by swing-menu-corr.sh" 
# -------------------------------------------
# Change to the appropriate settings in gtkrc in 
# /usr/share/themes/Adwaita/gtk-2.0/gtkrc for correct 
# displayed Swing menus in Adwaita theme.
sed -i -e 699c"\    xthickness = 1 # Changed by swing-menu-corr.sh" -e 700c"\    ythickness = 1 # Changed by swing-menu-corr.sh" /usr/share/themes/Adwaita/gtk-2.0/gtkrc

echo "Finished
You need to rerun your Java application(s) if already running" 
