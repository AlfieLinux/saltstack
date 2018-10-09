apache2:
  pkg.installed

/var/www/html/index.html:
  file.managed:
    - source: salt://apache/index.html

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf

/etc/hosts:
  file.managed:
    - source: salt://apache/hosts

/etc/apache2/sites-available/saltwebsite.conf:
  file.managed:
    - source: salt://apache/saltwebsite.conf

/etc/apache2/sites-enabled/saltwebsite.conf:
  file.symlink:
    - target: ../sites-available/saltwebsite.conf 

apache2restart:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-enabled/userdir.load
      - file: /etc/apache2/mods-enabled/userdir.conf
      - file: /etc/apache2/sites-enabled/saltwebsite.conf






