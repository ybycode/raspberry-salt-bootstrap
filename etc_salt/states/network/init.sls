wpasupplicant is installed:
  pkg.installed:
    - pkgs:
      - wpasupplicant

/etc/network/interfaces:
  file.managed:
    - source: salt://network/interfaces
    - user: root
    - group: root
    - mode: 644

/etc/network/wpa_supplicant.conf:
  file.managed:
    - source: salt://network/wpa_supplicant.conf
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: wpasupplicant is installed
    - unless: grep -q "ssid=" /etc/wpa_supplicant/wpa_supplicant.conf
