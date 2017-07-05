{%- from "xinetd/map.jinja" import xinetd with context -%}

xinetd:
  pkg.installed:
    - name: {{ xinetd.pkg }}
  service.running:
    - name: {{ xinetd.service }}
    - enable: True

# The following states are inert by default and can be used by other states to
# trigger a restart or reload as needed.
xinetd-reload:
  module.wait:
    - name: service.reload
    - m_name: {{ xinetd.service }}

xinetd-restart:
  module.wait:
    - name: service.restart
    - m_name: {{ xinetd.service }}
