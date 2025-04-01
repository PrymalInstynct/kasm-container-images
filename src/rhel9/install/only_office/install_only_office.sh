#!/usr/bin/env bash
set -ex

ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')
if [ "$ARCH" == "arm64" ] ; then
  echo "Only Office is not supported on arm64, skipping Only Office installation"
  exit 0
fi

if [[ "${DISTRO}" == @(oracle8|rockylinux9|rockylinux8|oracle9|rhel9|almalinux9|almalinux8|fedora39|fedora40) ]]; then
  dnf install -y https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm --nogpgcheck
  dnf install -y onlyoffice-desktopeditors
  if [ -z ${SKIP_CLEAN+x} ]; then
    dnf clean all
  fi
else
  yum install -y https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm --nogpgcheck
  yum install -y onlyoffice-desktopeditors
  if [ -z ${SKIP_CLEAN+x} ]; then
    yum clean all
  fi
fi

cp /usr/share/applications/onlyoffice-desktopeditors.desktop $HOME/Desktop
sed -i 's/ONLYOFFICE Desktop Editors/ONLYOFFICE/g' $HOME/Desktop/onlyoffice-desktopeditors.desktop
chmod +x $HOME/Desktop/onlyoffice-desktopeditors.desktop
# KASM-1541
sed -i 's#/usr/bin/onlyoffice-desktopeditors %U$#bash -c "source ~/.bashrc \&\& /usr/bin/onlyoffice-desktopeditors %U"#' /usr/share/applications/onlyoffice-desktopeditors.desktop
