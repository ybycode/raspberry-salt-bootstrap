Create the venv python virtualenv:
  virtualenv.managed:
    - name: /home/pi/venv
    - user: pi
    - require:
      - sls: users
      - sls: dependencies

Install python-picamera:
  cmd.run:
    - name: source /home/pi/venv/bin/activate && pip install picamera
    - user: pi
    - unless: source /home/pi/venv/bin/activate && pip freeze | grep -q picamera
    - require:
      - virtualenv: Create the venv python virtualenv
      - sls: users
