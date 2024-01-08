{% set users_github = salt['pillar.get']('users', []) %}

{% for user in users_github %}
{{ user }}_user_present:
  user.present:
    - name: {{ user }}
    - createhome: True
    - shell: /bin/bash

{{ user }}_ssh_key_present:
  ssh_auth.present:
    - user: {{ user }}
    - source: 'https://github.com/{{ user }}.keys'
    - config: /root/.ssh/authorized_keys
    {% endfor %}

{% for user in salt['pillar.get']('public_keys', []) %}
{{ user.user }}_user_present:
  user.present:
    - name: {{ user.user }}
    - createhome: True
    - shell: /bin/bash

{{ user.user }}_ssh_key_present:
  ssh_auth.present:
    - user: {{ user.user }}
    - contents: {{ user.key }}
    - source_type: text
    - config: /root/.ssh/authorized_keys

{% endfor %}




