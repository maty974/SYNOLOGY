#!/bin/bash

# Author: wuseman <wuseman@nr1.nu>
# Github: https://github.com/wuseman

mkdir -p /volume1/@entware-ng/opt
echo -e "Created /volume1/@entware-ng/opt..."

echo -e "Removed /opt and symlinked @entware-ng/opt into /opt"
rm -rf /opt
ln -sf /volume1/@entware-ng/opt /opt &> /dev/null

echo -e "Downloading 'entware_install.sh' from entware.net..."
wget -qO - http://pkg.entware.net/binaries/armv7/installer/entware_install.sh | /bin/sh &> /dev/null
/bin/ln -sf /volume1/@entware-ng/opt /opt &> /dev/null
/opt/etc/init.d/rc.unslung start &> /dev/null
echo -e "Done...."

echo -e "Creating a new script in /usr/local/etc/rc.d/entware-startup.sh..."
echo "

case $1 in
    start)
    mkdir -p /opt
    mount -o bind /volume1/@entware-ng/opt /opt
    /opt/etc/init.d/rc.unslung start
    ;;
    stop)
    ;;
esac" > /usr/local/etc/rc.d/entware-startup.sh
chmod +x /usr/local/etc/rc.d/entware-startup.sh
echo ". /opt/etc/profile" >> /root/.profile
source ~/.profile &> /dev/null
echo -e "Install was succesfully done, now please\ntry run opkg by execute 'opkg' if this wont work then please use /opt/bin/opkg.."
