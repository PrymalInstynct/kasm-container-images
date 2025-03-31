#!/usr/bin/env bash
set -ex
ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')
if [ "${ARCH}" == "arm64" ] ; then
    echo "Packer for arm64 currently not supported, skipping install"
    exit 0
fi
rpm --import https://rpm.releases.hashicorp.com/gpg
if [[ "${DISTRO}" == @(oracle8|rockylinux9|rockylinux8|oracle9|rhel9|almalinux9|almalinux8) ]]; then
  dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
  dnf install -y packer
cat <<- EOF | tee /etc/profile.d/00-alias.sh
alias packer='/usr/bin/packer'
EOF
  if [ -z ${SKIP_CLEAN+x} ]; then
    dnf clean all
  fi
elif [[ "${DISTRO}" == @(fedora39|fedora40) ]]; then
  dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
  # use fedora40 hashicorp packages for packer
  sed -i 's/$releasever/40/g' /etc/yum.repos.d/hashicorp.repo
  dnf install -y packer
cat <<- EOF | tee /etc/profile.d/00-alias.sh
alias packer='/usr/bin/packer'
EOF
  if [ -z ${SKIP_CLEAN+x} ]; then
    dnf clean all
  fi
else
  yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
  yum install -y packer
cat <<- EOF | tee /etc/profile.d/00-alias.sh
alias packer='/usr/bin/packer'
EOF
  if [ -z ${SKIP_CLEAN+x} ]; then
    yum clean all
  fi
fi
