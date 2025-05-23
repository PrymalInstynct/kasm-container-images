#!/usr/bin/env bash
set -ex

if [ -f /usr/bin/dnf ]; then
  dnf install -y git xz glibc-locale-source glibc-langpack-en
  if [ -z ${SKIP_CLEAN+x} ]; then
    dnf clean all
  fi
else
  yum-config-manager --enable ol7_optional_latest
  yum install -y git
  if [ -z ${SKIP_CLEAN+x} ]; then
    yum clean all
  fi
fi
