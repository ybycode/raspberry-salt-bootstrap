{{ grains['main_user'] }}:
  user.present:
    - fullname: raspberry pi
    - shell: /bin/bash
    - home: /home/{{ grains['main_user'] }}
    - groups:
      - docker
      - sudo
      - video
