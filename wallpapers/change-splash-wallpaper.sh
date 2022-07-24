#!/bin/bash

SRC_DIR=$(cd $(dirname $0) && pwd)

color="";

if [ "$UID" = "0" ]
then
  LOOKFEEL_DIR="/usr/share/plasma/look-and-feel"
else
  LOOKFEEL_DIR="$HOME/.local/share/plasma/look-and-feel"
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

cp -r $SRC_DIR/light/$color.jpg $LOOKFEEL_DIR/com.github.Cameo007.Windows11-KDE-Design-Light/contents/splash/images/background.jpg
cp -r $SRC_DIR/dark/$color.jpg $LOOKFEEL_DIR/com.github.Cameo007.Windows11-KDE-Design-Dark/contents/splash/images/background.jpg
