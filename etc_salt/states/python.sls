Create the venv python virtualenv:
  virtualenv.managed:
    - name: /home/{{ grains['main_user'] }}/venv
    - user: {{ grains['main_user'] }}
    - require:
      - sls: users
      - sls: dependencies

Install python-picamera:
  cmd.run:
    - name: source /home/{{ grains['main_user'] }}/venv/bin/activate && pip install picamera
    - user: {{ grains['main_user'] }}
    - unless: source /home/{{ grains['main_user'] }}/venv/bin/activate && pip freeze | grep -q picamera
    - require:
      - virtualenv: Create the venv python virtualenv
      - sls: users
