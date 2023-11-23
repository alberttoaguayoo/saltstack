webserver:
  pkg:
   - installed
   - pkgs: 
     - fail2ban

/etc/test/users:
   file.append:
{% for user in pillar['ssh_users'] %}
{% set user_keys = salt['http.query']('https://github.com/{{ user }}.keys', method='GET') %}
     - source: 'https://github.com/{{ user }}.keys'
{% endfor %}







#   file.append:
#     - text: {{ pillar['super_user'] }}
  
