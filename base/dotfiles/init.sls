dotfiles.git:
  file.managed:
    - name: /home/{{ salt['environ.get']('SUDO_USER') }}/.gitconfig
    - source: salt://dotfiles/files/gitconfig
    - user: {{ salt['environ.get']('SUDO_USER') }}
    - group: {{ salt['environ.get']('SUDO_USER') }}
    - template: jinja
    - context:
        name: {{ pillar['FULL_NAME'] }}
        email: {{ pillar['EMAIL'] }}

dotfiles.face:
  file.managed:
    - name: /home/{{ salt['environ.get']('SUDO_USER') }}/.face
    - source: salt://dotfiles/files/face.jpg
    - user: {{ salt['environ.get']('SUDO_USER') }}
    - group: {{ salt['environ.get']('SUDO_USER') }}
