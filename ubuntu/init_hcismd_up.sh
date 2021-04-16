#!/bin/sh

#Maximum number of attempts to enable hcismd to try to get
# hci0 to come online.  Writing to sysfs too early seems to
# not work, so we loop.
MAXTRIES=15

#/system/bin/insmod /system/lib/modules/wlan.ko
#/system/bin/insmod /system/lib/modules/hci_smd.ko

#Wifi enabler
j=1
while [ ! $j -gt $MAXTRIES ]  ; do
    echo 1 > /dev/wcnss_wlan
    echo sta > /sys/module/wlan/parameters/fwpath 
    if [ "$?" -ne "0" ]; then
      sleep 1
    fi
    
    j=$((j + 1))
done

#Start RIL modem
/usr/share/ofono/scripts/online-modem /ril_0
/usr/share/ofono/scripts/online-modem /ril_1


done

