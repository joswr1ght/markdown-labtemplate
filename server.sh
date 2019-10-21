#!/bin/bash

ps -ef | grep http.server | grep -v grep | awk {'print $2'} | xargs kill

cd ./wiki
python -m 'http.server' 8888
