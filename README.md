# swing-menu-corr

'swing-menu-corr' emends the following bugs when using Java
apps with Swing GTK-Look-and-Feel (LaF):

- missing menu border
- wrong font color of activated checkbox and radiobutton menu items
- no menu separators

in **Linux Mint 17.x** (Cinnamon edition). 

![image](http://blog.hani-ibrahim.de/wp-content/uploads/menutest_ani.gif)

## What swing-menu-corr.sh does

This script changes entries of the 'menus.rc' file in all "themes"
directories of `/usr/share/themes/[mint-theme]/gtk-2.0/styles`.

'swing-menu-corr' creates backup files as 'menus.rc.original' in every
directory before changing the original files. To undo the changes of 'swing-menu-corr.sh' use the script 'swing-menu-undo.sh' and you are at the state before you run 'swing-menu-corr.sh'.

This script was tested with Mint 17.1 und 17.2 Cinnamon edition.

Refer [http://blog.hani-ibrahim.de/swing-menus-gtk-laf.html](http://blog.hani-ibrahim.de/swing-menus-gtk-laf.html) for details.

## Usage

Refer file [USAGE](https://github.com/haniibrahim/swing-menu-corr/blob/master/USAGE) in the distribution for details

![image](http://blog.hani-ibrahim.de/wp-content/uploads/terminal_swing-menu-corr.png) 

Screenshot "swing-menu-corr.sh"

## License

This program is free software: you can redistribute it and/or modify it under the terms of the **GNU General Public License** as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
