#!/usr/bin/env bash

# This script is to be run on the raspberry. It performs the following:
# - Sets the salt configuration files up,
# - Runs salt to setup the raspberry.

set -euo pipefail

echo ----- Installing salt-minion and git...
sudo wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -
sudo echo "deb http://debian.saltstack.com/debian jessie-saltstack main" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y salt-minion git

cd $(dirname $0)

echo ----- Installing Salt configuration files...
sudo rm -Rf /etc/salt
sudo ln -s $(pwd)/etc_salt /etc/salt

echo ----- Running the configuration from Salt...
sudo salt-call --local state.highstate

echo ----- Done.
