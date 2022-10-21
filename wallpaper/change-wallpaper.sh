#!/bin/bash

color="";

if [ "$UID" = "0" ]
then
  WALLPAPER_DIR="/usr/share/wallpapers"
  LOOKFEEL_DIR="/usr/share/plasma/look-and-feel"
else
  WALLPAPER_DIR="$HOME/.local/share/wallpapers"
  LOOKFEEL_DIR="$HOME/.local/share/plasma/look-and-feel"
fi

while getopts m:c: flag
do
    case "${flag}" in
        c) color="$OPTARG";;
    esac
done

if ! [ -f "./wallpaper/Variants/light/$color.jpg" ]
then
    echo "Wallpaper \"$color\" not found"
    exit 1
fi

#Copy desktop wallpaper
cp -r ./wallpaper/Variants/light/$color.jpg $WALLPAPER_DIR/Win11OS-light/contents/images/3840x2400.jpg
cp -r ./wallpaper/Variants/dark/$color.jpg $WALLPAPER_DIR/Win11OS-dark/contents/images/3840x2400.jpg

#Copy splash screen wallpaper
cp -r ./wallpaper/Variants/light/$color.jpg $LOOKFEEL_DIR/com.github.Cameo007.Windows11-KDE-Design-Light/contents/splash/images/background.jpg
cp -r ./wallpaper/Variants/dark/$color.jpg $LOOKFEEL_DIR/com.github.Cameo007.Windows11-KDE-Design-Dark/contents/splash/images/background.jpg

echo "Please enter your password for changing the SDDM wallpaper if you aren't authenticated"
#Run script for copying SDDM wallpaper
exec sudo "./wallpaper/change-sddm-wallpaper.sh" "$@"
