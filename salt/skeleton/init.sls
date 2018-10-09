/etc/skel/public_html/:
  file.directory:
    - makedirs: True

/etc/skel/public_html/index.php:
  file.managed:
    - source: salt://skeleton/index.php

