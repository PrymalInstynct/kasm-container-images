#!/usr/bin/env bash
set -ex

if [[ "${DISTRO}" == @(rhel9) ]]; then
  subscription-manager repos --disable rhel-9-for-$(arch)-baseos-rpms
  subscription-manager repos --disable rhel-9-for-$(arch)-appstream-rpms
  subscription-manager repos --disable codeready-builder-for-rhel-9-$(arch)-rpms
  dnf -y remove epel-release git
  dnf clean all
  rm -rf /etc/pki/entitlement/*.pem
fi
