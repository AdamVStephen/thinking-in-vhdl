#!/usr/bin/env bash
TSTAMP=$(date +"%s")
# TODO: add a tmux here
nohup mdbook serve --open -p 8888 -n 192.168.1.43 2> serve.${TSTAMP}.err 1> serve.${TSTAMP}.log &

