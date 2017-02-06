include:
  - .numix

desktop.backgrounds:
  file.recurse:
    - name: /home/{{ salt['environ.get']('SUDO_USER') }}/.desktops
    - source: salt://appearance/files/desktops
    - makedirs: True
