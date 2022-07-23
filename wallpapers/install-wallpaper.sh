#!/bin/bash

mode="";
color="";

ROOT_UID=0
# Destination directory
if [ "$UID" == "$ROOT_UID" ]
then
  WALLPAPER_DIR="/usr/share/wallpapers"
else
  WALLPAPER_DIR="$HOME/.local/share/wallpapers"
fi

while getopts m:c: flag
do
    case "${flag}" in
        m) mode="$OPTARG";;
        c) color="$OPTARG";;
    esac
done

if [ "$mode" != "light" ] && [ "$mode" != "dark" ]
then
    echo "Please specify the mode (light/dark)"
    exit 1
fi

if ! [ -f "./$mode/$color.jpg" ]
then
    echo "Wallpaper \"$color\" not found"
    exit 1
fi

cp -r ./$mode/$color.jpg $WALLPAPER_DIR/Win11OS-$mode/contents/images/3840x2400.jpg
