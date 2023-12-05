{% set usuarios_github = salt['pillar.get']('users', []) %}

{% for usuario in usuarios_github %}
{{ usuario }}_user_present:
  user.present:
    - name: {{ usuario }}
    - createhome: True
    - shell: /bin/bash

{{ usuario }}_ssh_key_present:
  ssh_auth.present:
    - user: {{ usuario }}
    - source: 'https://github.com/{{ usuario }}.keys'
    - config: /root/.ssh/authorized_keys

#{{ usuario }}_private_key_present:
#  file.append:
#    - name: /root/.ssh/authorized_keys
#    - source: 'https://github.com/{{ usuario }}.keys'
{% endfor %}

