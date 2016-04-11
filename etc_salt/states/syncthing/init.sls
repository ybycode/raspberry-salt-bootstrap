The Syncthing APT repo is added:
  pkgrepo.managed:
    - humanname: syncthing
    - name: deb http://apt.syncthing.net/ syncthing release
    - gpgcheck: 1
    - key_url: salt://syncthin/release-key.txt
  
Syncthing is installed:
  pkg.installed:
    - pkgs:
      - syncthing
    - require:
      - pkgrepo: The Syncthing APT repo is added

Syncthing supervisor config file is set:
  file.managed:
    - name: /etc/supervisor/conf.d/syncthing.conf
    - source: salt://syncthing/supervisor.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: Syncthing is installed

Syncthing is run by supervisor:
  supervisord.running:
    - name: syncthing

