#!/bin/sh
ARCH=`echo "$1" | tr '/' ' ' | awk '{ print $2 }'`

if [[ "$ARCH" == 'arm' ]]; then
    ARCH='armhf'
fi

if [[ "$ARCH" == 'arm64' ]]; then
    ARCH='aarch64'
fi

wget -O /tmp/s6-overlay-$ARCH-installer https://github.com/just-containers/s6-overlay/releases/download/v2.1.0.2/s6-overlay-$ARCH-installer

chmod +x /tmp/s6-overlay-$ARCH-installer && /tmp/s6-overlay-$ARCH-installer /
