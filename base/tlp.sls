tlp:
  pkgrepo.managed:
    - ppa: linrunner/tlp
    - onlyif: dmidecode | grep 'ThinkPad'

  pkg.latest:
    - pkgs:
      - tlp
      - tlp-rdw
      - tp-smapi-dkms
      - acpi-call-dkms
    - onlyif: dmidecode | grep 'ThinkPad'
