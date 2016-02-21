# https://learn.adafruit.com/bluefruit-le-python-library/installation
bluefruit LE python library dependencies:
  pkg.installed:
   - pkgs:
     - libusb-dev
     - libdbus-1-dev
     - libglib2.0-dev
     - libudev-dev
     - libical-dev
     - libreadline-dev

compile and install the version 5.33 of bluez:
  cmd.run:
    - name: /etc/salt/states/bluefruit_LE/install.sh
    - unless: ls /usr/local/bin/bluetoothd
    - require:
      - sls: dependencies

make sure the bluetooth service starts at boot:
  cmd.run:
    - name: sed -i "$(cat /etc/rc.local | wc -l)i\/usr/local/bin/bluetoothd --experimental &" /etc/rc.local
    - unless: grep -q bluetoothd /etc/rc.local
    - require:
      - cmd: compile and install the version 5.33 of bluez

clone the Adafruit python library repo:
  git.latest:
    - name: https://github.com/adafruit/Adafruit_Python_BluefruitLE.git
    - target: /home/pi/git/adafruit_Python_BluefruitLE
    - user: pi
    - require:
      - pkg: dependencies
    - require:
      - sls: users

install the python library from the repo:
  cmd.run:
    - name: source /home/pi/venv/bin/activate && python setup.py install
    - user: pi
    - cwd: /home/pi/git/adafruit_Python_BluefruitLE
    - require:
      - sls: users
      - git: clone the Adafruit python library repo
      - virtualenv: Create the venv python virtualenv
    - unless: ls /home/pi/venv/lib/python2.7/site-packages/Adafruit_BluefruitLE-0.9.0-py2.7.egg

