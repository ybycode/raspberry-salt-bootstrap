# https://learn.adafruit.com/dht-humidity-sensing-on-raspberry-pi-with-gdocs-logging/software-install-updated

clone the Adafruit python library repo for the DHT sensors:
  git.latest:
    - name: https://github.com/adafruit/Adafruit_Python_DHT.git
    - target: /home/pi/git/adafruit_python_DHT
    - user: pi
    - require:
      - sls: users

install the library:
  cmd.run:
    - name: source /home/pi/venv/bin/activate && python setup.py install
    - cwd: /home/pi/git/adafruit_python_DHT
    - user: pi
    - require:
      - git: clone the Adafruit python library repo for the DHT sensors
      - virtualenv: Create the venv python virtualenv
    - unless: ls /home/pi/venv/lib/python2.7/site-packages/Adafruit_DHT-1.1.0-py2.7-linux-armv7l.egg
    - require:
      - sls: users

