# swing-menu-corr

'swing-menu-corr' emends the following bugs when using Java
apps with Swing GTK-Look-and-Feel (LaF):

- missing menu border
- wrong font color of activated checkbox and radiobutton menu items
- no menu separators

in **Linux Mint 17.x**, **18.x**, **19.x** an **20.x** (Cinnamon edition) in Mint-X and Adwaita themes. 

![image](http://blog.hani-ibrahim.de/wp-content/uploads/menutest_ani.gif)

## What swing-menu-corr.sh does

This script changes entries of the 'menus.rc' file in all "themes"
directories of `/usr/share/themes/[mint-theme]/gtk-2.0/styles`. In Version 1.2 it fixes the Adwaita theme as well.

'swing-menu-corr' creates backup files as 'menus.rc.original' in every
directory before changing the original files. To undo the changes of 'swing-menu-corr.sh' use the script 'swing-menu-undo.sh' and you are at the state before you run 'swing-menu-corr.sh'.

This script was tested with Mint 17.x, 18.x, 19.x an 20.x Cinnamon edition.

Refer [https://blog.hani-ibrahim.de/swing-menus-gtk-laf.html](https://blog.hani-ibrahim.de/swing-menus-gtk-laf.html) for details.

## Usage

Refer file [USAGE](https://github.com/haniibrahim/swing-menu-corr/blob/master/USAGE) in the distribution for details

![image](https://blog.hani-ibrahim.de/wp-content/uploads/terminal_swing-menu-corr.png) 

Screenshot "swing-menu-corr.sh" (v1.2.1)

## Changelog

| Version |  |
|-----|---------------------------|
|1.0  | Release                   |
|1.1  | Checks for Linux Mint 17  |
|1.1.1| USAGE file added          |
|1.2  | Adwaita theme fixed       |
|1.2.1| Prevent overwriting the original backupfile `gtkrc.original` when rerunning the script and add the `--version` option for version information and `--help` for a help page|
|1.2.2| Tested and adjusted on Mint 18.x |
|1.2.3| Tested and adjusted on Mint 19.x |
|1.2.4| Tested and adjusted on Mint 20.x |

## License

This program is free software: you can redistribute it and/or modify it under the terms of the **GNU General Public License** as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
