#!/bin/bash    

/usr/bin/expect <<EOF
set timeout 60
spawn /usr/bin/vncpasswd
expect "Password:"
send "$VNCPASS\r"
expect "Verify:"
send "$VNCPASS\r"
expect eof
EOF

rm -rf /tmp/.X*-lock /tmp/.X11-unix
vnc4server $DISPLAY &&
umask 0 &&
cloud
