#!/usr/bin/env bash

if [ `id -u` -ne 0 ]; then
    echo "ERROR! `basename ${0}` must be executed as root."
    exit 1
fi

CORE_PKG=$(basename ${0} .sh)
MORE_PKGS=""

pacman -S --needed --noconfirm ${CORE_PKG} ${MORE_PKGS}

ufw limit tcp/22
ufw default deny
ufw logging off
systemctl enable ufw
systemctl start ufw
ufw enable