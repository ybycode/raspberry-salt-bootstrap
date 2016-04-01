Install the vim config from git:
  git.latest:
    - name: https://github.com/ybycode/vim-config.git
    - target: /home/{{ grains['main_user'] }}/.vim
    - user: {{ grains['main_user'] }}
    - require:
      - pkg: dependencies
      - sls: users

Create the symbolic link:
  cmd.run:
    - name: ln -s /home/{{ grains['main_user'] }}/.vim/vimrc /home/{{ grains['main_user'] }}/.vimrc
    - user: {{ grains['main_user'] }}
    - require:
      - sls: users
      - git: Install the vim config from git
    - unless: ls /home/{{ grains['main_user'] }}/.vimrc

