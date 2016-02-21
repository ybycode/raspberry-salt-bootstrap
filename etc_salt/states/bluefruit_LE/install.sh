#!/usr/bin/env bash

VERSION=5.33

set -euo pipefail

cd /tmp
wget http://www.kernel.org/pub/linux/bluetooth/bluez-${VERSION}.tar.gz
tar xvfz bluez-${VERSION}.tar.gz
cd bluez-${VERSION}
./configure --disable-systemd
make
sudo make install
sudo cp ./src/bluetoothd /usr/local/bin/

# cleanup
cd ..
rm -Rf bluez-${VERSION}

