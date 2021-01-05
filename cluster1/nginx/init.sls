#!jinja|yaml

Ensure nginx is installed:
  pkg.installed:
    - name: nginx


Reconfig nginx page:
  file.managed:
    - name: /var/www/html/index.nginx-debian.html
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - contents_pillar: nginx_overwrite


