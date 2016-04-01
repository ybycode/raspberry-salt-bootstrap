fail2ban is installed:
  pkg.installed:
    - pkgs:
      - fail2ban

/etc/fail2ban/jail.d/own.conf:
  file.managed:
    - source: salt://fail2ban/own.conf
    - user: root
    - group: root
    - mode: 644

fail2ban:
  service.running:
    - enable: True
