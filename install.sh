#!/bin/bash
master=$(dirname $(readlink -fm "$0"))
exec ${master}/sh/yay-firmware.sh
exec ${master}/sh/fonts.sh
exec ${master}/sh/xorg.sh
