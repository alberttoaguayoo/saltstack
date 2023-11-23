webserver:
  pkg:
   - installed
   - pkgs: 
     - fail2ban

/etc/test/users:
   file.append:
{% for user in pillar['ssh_users'] %}
     - source: 'https://github.com/{{ user }}.keys'
{% endfor %}



  
