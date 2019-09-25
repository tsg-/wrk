#!/bin/bash

ulimit -n 65535
http_proxy= https_proxy= $HOME/wrk/wrk \
 -t 56 \
 -c 25000 \
 -d 300s \
 -s $HOME/wrk/scripts/query.lua \
 --timeout 10s \
 -L \
 https://192.168.100.113
