#!/usr/bin/env bash

# This script is to be run on the raspberry. It performs the following:
# - Sets the salt configuration files up,
# - Runs salt to setup the raspberry.

set -euo pipefail # Stop at first error, even between pipes

echo ----- Installing salt-minion and git...
wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -
echo "deb http://debian.saltstack.com/debian jessie-saltstack main" > /etc/apt/sources.list.d/saltstack.list
apt-get update
apt-get install -y git salt-minion

# get the absolute directory path of this file:
DIR=$(dirname $(readlink -f $0))
cd $DIR

echo ----- Installing Salt configuration files...
rm -Rf /etc/salt # removes the default files
ln -s $DIR/etc_salt /etc/salt # link our salt config in /etc

echo ----- Running the configuration from Salt...
salt-call state.highstate

echo ----- Done.
