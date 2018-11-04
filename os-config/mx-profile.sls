{% set user = salt['pillar.get']('users:primary-user') %}
{% set userinfo = salt['user.info'](user) %}

Create MX profile container for things Mx wants to add to user profiles:
  file.managed:
    - name: {{ userinfo.home }}/.mx_profile
    - user: root
    - mode: 0755
    - replace: false

{% set rcfile = '.bashrc' %}
{% if grains.os in ('MacOS',) %}
  {% set rcfile = '.bash_profile' %}
{% endif %}
Ensure user profile exists:
  file.managed:
    - name: {{ userinfo.home }}/{{ rcfile }}
    - user: {{ user }}
    - mode: 600

Ensure user is running the mx profile content:
  file.append:
    - name: {{ userinfo.home }}/{{ rcfile }}
    - text: source ~/.mx_profile
