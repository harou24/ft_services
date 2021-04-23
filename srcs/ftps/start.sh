#!/bin/sh

telegraf &
/usr/sbin/pure-ftpd -Y 2 -p 30000:30000 -P $EXTERNAL_IP
