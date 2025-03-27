#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

LOCALES_RHEL="glibc-langpack-en"

LOCALES="en_AG en_AU en_BW en_CA en_DK en_GB en_HK en_IE en_IN en_NG en_NZ en_PH en_SG en_US en_ZA en_ZM"

echo "Installing fonts and languages"
if [[ "${DISTRO}" == @(rhel9) ]]; then
  dnf install -y \
    glibc-locale-source \
    google-noto-emoji-fonts \
    google-noto-sans-cjk-ttc-fonts \
    google-noto-sans-fonts \
    ${LOCALES_RHEL}
  for LOCALE in ${LOCALES}; do
    echo "Generating Locale for ${LOCALE}"
    localedef -i ${LOCALE} -f UTF-8 ${LOCALE}.UTF-8
  done
fi