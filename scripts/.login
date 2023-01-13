#!/usr/bin/bash

VPN=$(nmcli con show --active | grep -c vpn)

if [ "$VPN" -eq 0 ]; then
    echo "Connecting to VPN..."
    /usr/bin/bash ~/.totp | nmcli con up "Farnborough (FAB)" --ask > /dev/null
fi

echo "Logging in..."
kinit gzuccare@REDHAT.COM -k -t ~/.auth/redhat.keytab
