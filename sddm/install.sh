#!/bin/bash

SRC_DIR=$(cd $(dirname $0) && pwd)

if [ "$EUID" != "0" ]
then
  exec sudo "$0" "$@"
fi

chmod u+x $SRC_DIR/light/install.sh
chmod u+x $SRC_DIR/dark/install.sh

$SRC_DIR/light/install.sh
$SRC_DIR/dark/install.sh

