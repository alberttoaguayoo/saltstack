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

add_user:
   user.present:
{% for user in pillar['ssh_users'] %}  
     - name: {{ user }}
     - empty_password: True
     - shell: /bin/bash
    
{% endfor %}
