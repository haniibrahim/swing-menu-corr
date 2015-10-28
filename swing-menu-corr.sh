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

- menu border
- font color of checkbox and radiobutton menu items
- color of menu separators

in Linux Mint 17.x. Refer http://www.microchip.com/forums/m844821.aspx for
details."



# Create safety copies with ".original" suffix
find $dir -name "menus.rc" -exec cp {} {}.original \;

# Change the appropriate settings in menus.rc.
find $dir -name "menus.rc" -print | xargs sed -i 's/"fg[ACTIVE] = @base_color"/"fg[ACTIVE] = @fg_color"/g';'s/"style \"menu\" 
{
    xthickness = 0
    ythickness = 0"/"style "\menu\" 
{
    xthickness = 1
    ythickness = 1"/g';'s/"style \"menu-item-separator\" 
{
    GtkSeparatorMenuItem::horizontal-padding = 0
    GtkWidget::wide-separators = 1
    GtkWidget::separator-width = 1
    GtkWidget::separator-height = 7
    
    xthickness = 1
    ythickness = 0"/"style "\menu-item-separator\" 
{
    GtkSeparatorMenuItem::horizontal-padding = 0
    GtkWidget::wide-separators = 1
    GtkWidget::separator-width = 1
    GtkWidget::separator-height = 7
    
    xthickness = 1
    ythickness = 1"/g'

