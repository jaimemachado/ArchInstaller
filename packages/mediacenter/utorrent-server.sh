#!/usr/bin/env bash

if [ `id -u` -ne 0 ]; then
    echo "ERROR! `basename ${0}` must be executed as root."
    exit 1
fi

CORE_PKG=$(basename ${0} .sh)
MORE_PKGS=""

packer -S --noedit --noconfirm ${CORE_PKG} ${MORE_PKGS}

systemctl enable utserver