#!/bin/bash

color="";

if [ "$UID" != 0 ]
then
  exec sudo "$0" "$@"
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

cp -r ./wallpaper/Variants/light/$color.jpg /usr/share/sddm/themes/Win11OS-light/background.jpg
cp -r ./wallpaper/Variants/dark/$color.jpg /usr/share/sddm/themes/Win11OS-dark/background.jpg
