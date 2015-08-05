#!/bin/sh

LOGDIR="./apache2/"

find $LOGDIR -type f -exec sudo truncate -s 0 {} \;

