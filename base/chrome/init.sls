chrome:
  pkg.installed:
    - sources:
      - google-chrome-stable: https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

chrome.policy:
  file.managed:
    - name: /etc/opt/chrome/policies/managed/outrigger_policy.json
    - source: salt://chrome/files/outrigger_policy.json
    - template: jinja
    - makedirs: True
    - context:
        extensions:
          - hdokiejnpimakedhajhdlcegeplioahd # Lastpass
          - cjpalhdlnbpafiamejdnhcphjbkeiagm # Ublock origin
          - pkehgijcmpdhfbdbbnkijodmdjhbjlgp # Privacy Badger
