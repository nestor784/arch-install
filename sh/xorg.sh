#!/bin/bash
#
master=$(dirname $(dirname $(readlink -fm "$0")))
yay -S - < ${master}/etc/pkgxorg.txt
