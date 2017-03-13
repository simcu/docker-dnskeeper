#!/bin/sh
echo 'Get new gfwrules ....... '
curl https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt > /home/gfwrules.list
echo 'Start Redis server ......'
redis-server /home/redis.conf
echo 'Start Dns Server ......'
export NODE_ENV=production
node dns-server.js