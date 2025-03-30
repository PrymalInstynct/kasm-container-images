#!/usr/bin/env bash
set -ex

if [[ "${DISTRO}" == @(rhel9) ]]; then
  dnf -y install git
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  python3 get-pip.py
  pip3 install ansible
  pip3 install pip-autoremove
fi
