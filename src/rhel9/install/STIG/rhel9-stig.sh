#!/usr/bin/env bash
set -ex

if [[ "${DISTRO}" == @(rhel9) ]]; then
    git clone https://github.com/PrymalInstynct/RHEL9-STIG-MPG.git
    cp inventory.yml RHEL9-STIG-MPG/
    pushd RHEL9-STIG-MPG
    git checkout Mar2025_testing
    ansible-galaxy collection install -r collections/requirements.yml
    ansible-playbook -i inventory.yml site.yml
fi