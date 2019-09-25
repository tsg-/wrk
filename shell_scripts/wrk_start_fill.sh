#!/bin/bash

ulimit -n 65535
http_proxy= https_proxy= $HOME/wrk/wrk \
 -t 56 \
 -c 20000 \
 -d 600s \
 -s $HOME/wrk/scripts/query.lua \
 --timeout 10s \
 https://192.168.100.111
