pyenv.prereq:
  pkg.latest:
    - pkgs:
      - make
      - build-essential
      - libssl-dev
      - zlib1g-dev
      - libbz2-dev
      - libreadline-dev
      - libsqlite3-dev
      - wget
      - curl
      - llvm
      - libncurses5-dev
      - libncursesw5-dev
      - xz-utils

pyenv.install:
  git.latest:
    - name: https://github.com/pyenv/pyenv.git
    - target: /home/{{ salt['environ.get']('SUDO_USER') }}/.pyenv
    - user: {{ salt['environ.get']('SUDO_USER') }}

pyenv.virtualenv.install:
  git.latest:
    - name: https://github.com/pyenv/pyenv-virtualenv.git
    - target: /home/{{ salt['environ.get']('SUDO_USER') }}/.pyenv/plugins/pyenv-virtualenv
