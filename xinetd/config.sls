{%- from "xinetd/map.jinja" import xinetd with context -%}

{%- if xinetd.services is iterable %}
{%- for service, config in xinetd.services.iteritems() %}
xinetd_{{ service }}_config:
  file.managed:
    - name: /etc/xinetd.d/{{ service }}
    - source: salt://xinetd/files/config_template
    - template: jinja
    - context:
        service: {{ service }}
        config: {{ config }}
    - watch_in:
        service: xinetd
{% endfor %}
{% endif %}
