Install the vim config from git:
  git.latest:
    - name: https://github.com/ybycode/vim-config.git
    - target: /home/pi/.vim
    - user: pi
    - require:
      - pkg: dependencies
      - sls: users

Create the symbolic link:
  cmd.run:
    - name: ln -s /home/pi/.vim/vimrc /home/pi/.vimrc
    - user: pi
    - require:
      - sls: users
      - git: Install the vim config from git
    - unless: ls /home/pi/.vimrc

