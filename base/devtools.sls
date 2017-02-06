projects:
  file.directory:
    - name: /home/{{ salt['environ.get']('SUDO_USER') }}/Projects
    - user: {{ salt['environ.get']('SUDO_USER') }}
    - group: {{ salt['environ.get']('SUDO_USER') }}
