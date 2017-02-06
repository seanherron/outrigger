#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root." 1>&2
  exit 1
fi

DIRECTORY=`dirname "$(readlink -f "$0")"`
source $DIRECTORY/settings.conf

apt-get update -y
apt-get upgrade -y

if ! hash git 2>/dev/null; then
  echo "Installing git"
  apt-get install git -y
  echo "Done installing git"
fi

if ! hash curl 2>/dev/null; then
  echo "Installing curl"
  apt-get install curl -y
  echo "Done installing curl"
fi

if ! hash salt-minion 2>/dev/null; then
  echo "Installing Salt"
  curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
  sh bootstrap_salt.sh -X -A localhost -i $HOSTNAME
  rm bootstrap_salt.sh
  echo "Done installing Salt"
fi

if hash salt-minion 2>/dev/null; then
  mkdir -p /etc/salt/minion.d
  echo "file_client: local" > /etc/salt/minion.d/99-file-client.conf
  echo -e "file_roots:\n  base:\n    - $DIRECTORY/base" > /etc/salt/minion.d/99-file-roots.conf
  salt-call --local state.highstate pillar="{'EMAIL': $EMAIL, 'FULL_NAME': $FULL_NAME}"
fi

#echo "Run the following:"
#echo 'xfconf-query -c xsettings -p /Net/ThemeName -s "Numix"'
#echo 'xfconf-query -c xfwm4 -p /general/theme -s "Numix"'
#echo 'xfconf-query -c xsettings -p /Net/IconThemeName -s "Numix-Circle"'
