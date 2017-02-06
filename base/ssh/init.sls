ssh:
  pkg.latest:
    - name: ssh

  service.running:
    - name: ssh
    - enable: True

ssh.config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://ssh/files/sshd_config
    - watch_in:
      - service: ssh

ssh.keydir:
  file.directory:
    - name: /home/{{ salt['environ.get']('SUDO_USER') }}/.ssh
    - mode: 700
    - user: {{ salt['environ.get']('SUDO_USER') }}
    - group: {{ salt['environ.get']('SUDO_USER') }}

fail2ban:
  pkg.latest:
    - name: fail2ban
