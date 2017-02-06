vagrant:
  pkg.installed:
    - sources:
      - vagrant: https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb

virtualbox:
  pkg.latest:
    - name: virtualbox
    
virt-manager:
  pkg.latest:
    - name: virt-manager
