 #!/bin/bash

if [ "$UID" = "0" ]
then
  AURORAE_DIR="/usr/share/aurorae/themes"
  SCHEMES_DIR="/usr/share/color-schemes"
  PLASMA_DIR="/usr/share/plasma/desktoptheme"
  LAYOUT_DIR="/usr/share/plasma/layout-templates"
  LOOKFEEL_DIR="/usr/share/plasma/look-and-feel"
  KVANTUM_DIR="/usr/share/Kvantum"
  WALLPAPER_DIR="/usr/share/wallpapers"
  ICONS_DIR="/usr/share/icons"
else
  AURORAE_DIR="$HOME/.local/share/aurorae/themes"
  SCHEMES_DIR="$HOME/.local/share/color-schemes"
  PLASMA_DIR="$HOME/.local/share/plasma/desktoptheme"
  LAYOUT_DIR="$HOME/.local/share/plasma/layout-templates"
  LOOKFEEL_DIR="$HOME/.local/share/plasma/look-and-feel"
  KVANTUM_DIR="$HOME/.config/Kvantum"
  WALLPAPER_DIR="$HOME/.local/share/wallpapers"
  ICONS_DIR="$HOME/.local/share/icons"
fi

SRC_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME="Windows 11 KDE-Design"

uninstall() {
  local name=${1}

  local AURORAE_THEME="${AURORAE_DIR}/${name}"
  local PLASMA_THEME="${PLASMA_DIR}/${name}"
  local LOOKFEEL_THEME="${LOOKFEEL_DIR}/com.github.cameo007.${name}"

  [[ -d ${AURORAE_THEME} ]] && rm -rfv ${AURORAE_THEME}
  [[ -d ${PLASMA_THEME} ]] && rm -rfv ${PLASMA_THEME}
  [[ -d ${LOOKFEEL_THEME} ]] && rm -rfv ${LOOKFEEL_THEME}
  [[ -d ${KVANTUM_THEME}/${name} ]] && rm -rfv ${KVANTUM_THEME}/${name}
  [[ -d ${SCHEMES_DIR}/${name}.colors ]] && rm -rfv ${SCHEMES_DIR}/${name}.colors
  [[ -d ${WALLPAPER_DIR}/${name} ]] && rm -rfv ${WALLPAPER_DIR}/{Win11OS-light,Win11OS-dark}
  [[ -d ${ICONS_DIR}/${name} ]] && rm -rfv ${ICONS_DIR}/${name}
}

echo "Uninstalling \"${THEME_NAME}\"..."

uninstall "${name:-${THEME_NAME}}"

echo "Uninstall finished."
