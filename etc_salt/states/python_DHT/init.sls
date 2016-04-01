# https://learn.adafruit.com/dht-humidity-sensing-on-raspberry-pi-with-gdocs-logging/software-install-updated

clone the Adafruit python library repo for the DHT sensors:
  git.latest:
    - name: https://github.com/adafruit/Adafruit_Python_DHT.git
    - target: /home/{{ grains['main_user'] }}/git/adafruit_python_DHT
    - user: {{ grains['main_user'] }}
    - require:
      - sls: users

install the library:
  cmd.run:
    - name: source /home/{{ grains['main_user'] }}/venv/bin/activate && python setup.py install
    - cwd: /home/{{ grains['main_user'] }}/git/adafruit_python_DHT
    - user: {{ grains['main_user'] }}
    - require:
      - git: clone the Adafruit python library repo for the DHT sensors
      - virtualenv: Create the venv python virtualenv
    - unless: ls /home/{{ grains['main_user'] }}/venv/lib/python2.7/site-packages/Adafruit_DHT-1.1.0-py2.7-linux-armv7l.egg
    - require:
      - sls: users

