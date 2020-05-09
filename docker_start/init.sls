docker_up:
  cmd.run:
    - name: docker-compose up -d
    - cwd: /root/opensourcewebsite-org/
    - shell: '/bin/bash'

docker_php_composer:
  cmd.run:
    - name: 'docker-compose exec -T php composer install'
    - cwd: /root/opensourcewebsite-org/
    - shell: '/bin/bash'
    - require:
        - cmd: docker_up

docker_php_migrate:
  cmd.run:
    - name: 'docker-compose exec -T php ./yii migrate --interactive=0'
    - cwd: /root/opensourcewebsite-org/
    - shell: '/bin/bash'
    - require:
        - cmd: docker_php_composer

assets_chmod:
  cmd.run:
    - name: 'chmod 777 /root/opensourcewebsite-org/web/assets'
    - cwd: /root/opensourcewebsite-org/
    - shell: '/bin/bash'
    - require:
        - cmd: docker_php_migrate
