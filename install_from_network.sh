#!/usr/bin/env bash

# This script is to be run from the machine that accesses to the rpi.
# It performs the following:
# - it adds the system public key as an authorized key on the raspberry,
# - it sends the rpi-install.sh script to the rpi and executes it from there.

set -euo pipefail

usage="Usage: $(basename "$0") IP USERNAME: run the installation and configuration of the RPI at the given IP address, and the username to connect with"

if [[ $# -lt 2 ]]; then
    # if there are no arguments, meaning not the necessary IP address, and the
    # username, quit.
    echo $usage
    exit 1
fi

ip=$1
username=$2

echo ----- Adding the public SSH key as the authorized key...
cat ~/.ssh/id_rsa.pub | ssh $username@$ip "mkdir -p ~/.ssh && cat - > ~/.ssh/authorized_keys"

echo ----- Copying the files to the raspberry and run the install from there...

#DIR=$(dirname $(readlink -f $0))
cd $(dirname $0)
DIR=${PWD##*/} # the directory name

scp -r ../$DIR $username@$ip:~

echo ----- Running the install script from here...
ssh $username@$ip /home/$username/$DIR/install_from_rpi.sh

echo ----- Done.
