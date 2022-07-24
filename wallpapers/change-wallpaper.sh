#!/bin/bash

SRC_DIR=$(cd $(dirname $0) && pwd)

color="";

if [ "$UID" = "0" ]
then
  WALLPAPER_DIR="/usr/share/wallpapers"
else
  WALLPAPER_DIR="$HOME/.local/share/wallpapers"
fi

while getopts m:c: flag
do
    case "${flag}" in
        c) color="$OPTARG";;
    esac
done

if ! [ -f "$SRC_DIR/light/$color.jpg" ]
then
    echo "Wallpaper \"$color\" not found"
    exit 1
fi

cp -r $SRC_DIR/light/$color.jpg $WALLPAPER_DIR/Win11OS-light/contents/images/3840x2400.jpg
cp -r $SRC_DIR/dark/$color.jpg $WALLPAPER_DIR/Win11OS-dark/contents/images/3840x2400.jpg
