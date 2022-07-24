#!/bin/bash

SRC_DIR=$(cd $(dirname $0) && pwd)

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

if ! [ -f "$SRC_DIR/light/$color.jpg" ]
then
    echo "Wallpaper \"$color\" not found"
    exit 1
fi

cp -r $SRC_DIR/light/$color.jpg /usr/share/sddm/themes/Win11OS-light/background.jpg
cp -r $SRC_DIR/dark/$color.jpg /usr/share/sddm/themes/Win11OS-dark/background.jpg
