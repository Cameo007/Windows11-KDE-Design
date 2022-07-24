#!/bin/bash

SCRIPT_DIR="$(cd $(dirname $0) && pwd)"

mode="";

if [ "$EUID" -ne 0 ]
then
  exec sudo "$0" "$@"
fi

chmod u+x $SCRIPT_DIR/light/install.sh
chmod u+x $SCRIPT_DIR/dark/install.sh

while getopts m:c: flag
do
    case "${flag}" in
        m) mode="$OPTARG";;
    esac
done

if [ "$mode" == "light" ]
then
  $SCRIPT_DIR/light/install.sh
elif [ "$mode" == "dark" ]
then
  $SCRIPT_DIR/dark/install.sh
else
    echo "Please specify the mode (light/dark)"
fi

