pi:
  user.present:
    - fullname: raspberry pi
    - shell: /bin/bash
    - home: /home/pi
    - groups:
      - sudo
      - video
