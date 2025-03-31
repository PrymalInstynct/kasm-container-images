#!/bin/bash

PRG_INSTALL='/opt/idea-IC'

cd "${PRG_INSTALL}"

ICON_NAME=jetbrains-idea
TMP_DIR=`mktemp --directory`
DESKTOP_FILE=$TMP_DIR/jetbrains-idea.desktop
cat << EOF > $DESKTOP_FILE
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Intellij IDEA
Keywords=java;intellij;idea
GenericName=Java Integrated Development Environment
Type=Application
Categories=Development;Programming
Terminal=false
StartupNotify=true
Exec="$PRG_INSTALL/idea.sh" %u
Icon=$ICON_NAME.svg
EOF

xdg-desktop-menu install $DESKTOP_FILE
xdg-icon-resource install --size 128 "$PRG_INSTALL/$ICON_NAME.svg" $ICON_NAME

chmod +x $HOME/Desktop/jetbrains-idea.desktop
chown 1000:1000 $HOME/Desktop/jetbrains-idea.desktop

rm $DESKTOP_FILE
rm -R $TMP_DIR
