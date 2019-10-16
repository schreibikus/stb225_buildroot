#!/bin/sh

case "$2" in
    CONNECTED)
        udhcpc -R -n -p /var/run/udhcpc.$1.pid -i $1
        ;;
    DISCONNECTED)
        if [ -f /var/run/udhcpc.$1.pid ];then
            start-stop-daemon -K -q -p /var/run/udhcpc.$1.pid
        fi
        ;;
    *)
        ;;
esac
