mpd and deps are installed:
  pkg.installed:
    - pkgs:
      - alsa-utils
      - mpg321
      - lame
      - mpd

/etc/mpd.conf:
  file.managed:
    - source: salt://mpd/mpd.conf
    - user: root
    - group: root
    - mode: 644

/mnt/music:
  mount.mounted:
    - device: 192.168.0.35:/volume1/music
    - fstype: nfs
    - opts: auto,ro
    - mkmnt: True

mpd:
  service.running:
    - enable: True
