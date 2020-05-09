git:
  pkg.installed

opensourcewebsite-prod:
  git.latest:
    - name: https://github.com/opensourcewebsite-org/opensourcewebsite-org.git
    - target: /root/opensourcewebsite-org
    - force_reset: True
    - require:
      - pkg: git

opensourcewebsite-set:
  file.rename:
    - name: /root/opensourcewebsite-org/.env
    - source: /root/opensourcewebsite-org/.env.dist
    - force: True

opensourcewebsite-set-test:
  file.rename:
    - name: /root/opensourcewebsite-org/.env.test
    - source: /root/opensourcewebsite-org/.env.test.dist
    - force: True

/root/opensourcewebsite-org/.env:
  file.line:
    - content: "DB_HOST=db"
    - match: "DB_HOST=localhost"
    - mode: "replace"

/root/opensourcewebsite-org/.env.test:
  file.line:
    - content: "DB_HOST=db"
    - match: "DB_HOST=localhost"
    - mode: "replace"

opensourcewebsite-param:
  file.rename:
    - name: /root/opensourcewebsite-org/config/params.php
    - source: /root/opensourcewebsite-org/config/params.dist.php
    - force: True

opensourcewebsite-param2:
  file.rename:
    - name: /root/opensourcewebsite-org/config/web-local.php
    - source: /root/opensourcewebsite-org/config/web-local.dist.php
    - force: True
