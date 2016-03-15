ddclient is installed:
  pkg.installed:
    - pkgs:
      - ddclient

/etc/ddclient.conf:
  file.managed:
    - source: salt://dyndns/ddclient.conf
    - user: root
    - group: root
    - mode: 600
    - unless: ls /etc/ddclient.conf

ddclient:
  service.running:
    - enable: True
