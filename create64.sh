#!/bin/bash
#
# Build dropcaches package
#
# 1. Removed uninstall script, as it is not longer needed if used as package
# 2. Own all files to root: chown -R root:root *
# 3. run as root
#    sudo dpkg -b dropcaches-install dropcaches-1.0.0_x64.deb
# 4. check contents
#    dpkg -c dropcaches-1.0.0_x64.deb
#
# Marc Weidler, Dezember 2011
#
#set -x
set -u

PACKAGENAME=dropcaches-1.0.0_x64.deb

#
# Check root privileges.
#
if [[ $EUID -ne 0 ]]
then
  echo "This script can only be ran as root."
  exit
fi


sudo chmod 440 dropcaches-install/etc/sudoers.d/dropcaches
sudo chown -R root:root dropcaches-install/
sudo dpkg -b dropcaches-install $PACKAGENAME
sudo chown -R mweidler:mweidler dropcaches-install/
sudo chmod 644 dropcaches-install/etc/sudoers.d/dropcaches
sudo chown mweidler:mweidler $PACKAGENAME
dpkg -c $PACKAGENAME

