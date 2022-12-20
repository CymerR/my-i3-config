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


if [[ "$see_packages" == "y" ]] then
    echo "packages list is: [ $packages ]"
fi

for i in "${(ps. .)packages}"; do
     sudo pacman -S $i --noconfirm --color always -p --print-format "%n : %v : %s Mb" --needed    
done

echo "Done installing!"

DIR="/home/$SUDO_USER/.config"
#DIR="/home/$SUDO_USER/Документы/temp"


if [[ !(-a "$DIR") ]] then
    mkdir $DIR
    echo "Created dirs!"
fi
echo "Started copying!"
cp i3 i3status polybar -r -t $DIR


echo "Done!"
