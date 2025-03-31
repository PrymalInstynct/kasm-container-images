#!/usr/bin/env bash
set -ex
ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')

rpm --import https://pkgs.k8s.io/core:/stable:/v1.32/rpm/repodata/repomd.xml.key
cp kubernetes.repo /etc/yum.repos.d/
if [[ "${DISTRO}" == @(oracle8|rockylinux9|rockylinux8|oracle9|rhel9|almalinux9|almalinux8|fedora39|fedora40) ]]; then
  dnf install -y kubectl
  if [ -z ${SKIP_CLEAN+x} ]; then
    dnf clean all
  fi
else
  yum install -y kubectl
  if [ -z ${SKIP_CLEAN+x} ]; then
    yum clean all
  fi
fi
