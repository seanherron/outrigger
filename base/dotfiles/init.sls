dotfiles.git:
  file.managed:
    - name: /home/{{ salt['environ.get']('SUDO_USER') }}/.gitconfig
    - source: salt://dotfiles/files/gitconfig
    - template: jinja
    - context:
        name: {{ pillar['FULL_NAME'] }}
        email: {{ pillar['EMAIL'] }}
