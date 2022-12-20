#! /bin/zsh
#
# gnome-screenshot, nitrogen, wezterm, picom

if [[ "$EUID" -ne 0 ]] then
    echo "run as root"
    exit
fi

packages="gnome-screenshot nitrogen wezterm picom"




echo -n "Do you want to see package list?[yn]"
read see_packages


if [[ "$see_packages" -eq "y" ]] then

    echo "packages list is: [ $packages ]"
fi
