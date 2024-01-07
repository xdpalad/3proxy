#!/bin/sh
#
# chkconfig: 2345 20 80
# description: 3proxy tiny proxy server
#
#
#
#

case "$1" in
   start)
       echo Starting 3Proxy_two

       /usr/local/etc/3proxy/bin/3proxy_two /usr/local/etc/3proxy/3proxy_two.cfg

       RETVAL=$?
       echo
       [ $RETVAL ]
       ;;

   stop)
       echo Stopping 3Proxy_two
       if [ /usr/local/etc/3proxy/3proxy_two.pid ]; then
	       /bin/kill `cat /usr/local/etc/3proxy/3proxy_two.pid`
       else
               /usr/bin/killall 3proxy_two
       fi

       RETVAL=$?
       echo
       [ $RETVAL ]
       ;;

   restart|reload)
       echo Reloading 3Proxy_two
       if [ /usr/local/etc/3proxy/3proxy_two.pid ]; then
	       /bin/kill -s USR1 `cat /usr/local/etc/3proxy/3proxy_two.pid`
       else
               /usr/bin/killall -s USR1 3proxy_two
       fi
       ;;


   *)
       echo Usage: $0 "{start|stop|restart}"
       exit 1
esac
exit 0
