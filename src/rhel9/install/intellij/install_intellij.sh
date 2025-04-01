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
  tar xzf ideaIC.tar.gz -C /opt/idea-IC --strip-components=1
  # Download Latest OpenJDK Release https://jdk.java.net/24/ or Switch to an archive https://jdk.java.net/archive/
  curl -fSL https://download.java.net/java/GA/jdk24/1f9ff9062db4449d8ca828c504ffae90/36/GPL/openjdk-24_linux-x64_bin.tar.gz -o openjdk-24_linux-x64_bin.tar.gz
  mkdir -p $HOME/.jdks/openjdk-24
  tar xzf openjdk-24_linux-x64_bin.tar.gz -C $HOME/.jdks/openjdk-24 --strip-components=1
  cp -r $INST_DIR/rhel9/install/intellij/JetBrains $HOME/.config/
  chown 1000:1000 $HOME/.config/JetBrains
  rm -f ideaIC.tar.gz
fi
