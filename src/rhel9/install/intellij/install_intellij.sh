#!/usr/bin/env bash
set -ex
ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')
if [ "${ARCH}" == "arm64" ] ; then
    echo "Intellij for arm64 currently not supported, skipping install"
    exit 0
fi
if [[ "${DISTRO}" == @(oracle8|rockylinux9|rockylinux8|oracle9|rhel9|almalinux9|almalinux8|fedora39|fedora40) ]]; then
  curl -fSL https://download.jetbrains.com/idea/ideaIC-2024.3.5.tar.gz -o ideaIC.tar.gz
  mkdir /opt/idea-IC
  tar xvzf ideaIC.tar.gz -C /opt/idea-IC --strip-components=1
  cp -r $INST_SCRIPTS/rhel9/install/intellij/JetBrains $HOME/.config/
  chown 1000:1000 $HOME/.config/JetBrains
  rm -f ideaIC.tar.gz
fi
