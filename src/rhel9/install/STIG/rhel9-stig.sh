#!/usr/bin/env bash
set -ex

git clone https://github.com/ansible-lockdown/RHEL9-STIG.git
pushd RHEL9-STIG
ansible-galaxy collection install -r collections/requirements.yml
ansible-playbook -i inventory.yml site.yml
