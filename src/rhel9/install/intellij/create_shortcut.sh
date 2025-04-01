#!/usr/bin/env bash
set -ex
if [[ "${DISTRO}" == @(oracle8|rockylinux9|rockylinux8|oracle9|rhel9|almalinux9|almalinux8|fedora39|fedora40) ]]; then
  cp $INST_DIR/rhel9/install/intellij/jetbrains-idea.desktop /usr/share/applications/
  cp $INST_DIR/rhel9/install/intellij/jetbrains-idea.desktop $HOME/Desktop/
fi
