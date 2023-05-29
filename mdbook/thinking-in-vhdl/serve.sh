#!/usr/bin/env bash
TSTAMP=$(date +"%s")
# TODO: add a tmux here

case $(hostname) in
        ukaea-fpga.ccfepc.ccfe.ac.uk)
                mdbook serve --open -p 8888 -n 10.208.17.2  2>&1 | tee -a serve.${TSTAMP}.log &
                ;;
        *)
                echo "Host not recognised"
                ;;
esac
exit 0

cat << EOF
nohup mdbook serve --open -p 8888 -n 192.168.1.43 2> serve.${TSTAMP}.err 1> serve.${TSTAMP}.log &

inet 172.21.0.1  netmask 255.255.0.0  broadcast 172.21.255.255
inet 172.23.0.1  netmask 255.255.0.0  broadcast 172.23.255.255
inet 172.29.0.1  netmask 255.255.0.0  broadcast 172.29.255.255
inet 192.168.16.1  netmask 255.255.240.0  broadcast 192.168.31.255
inet 172.28.0.1  netmask 255.255.0.0  broadcast 172.28.255.255
inet 192.168.0.1  netmask 255.255.240.0  broadcast 192.168.15.255
inet 172.24.0.1  netmask 255.255.0.0  broadcast 172.24.255.255
inet 172.18.0.1  netmask 255.255.0.0  broadcast 172.18.255.255
inet 192.168.48.1  netmask 255.255.240.0  broadcast 192.168.63.255
inet 172.25.0.1  netmask 255.255.0.0  broadcast 172.25.255.255
inet 172.27.0.1  netmask 255.255.0.0  broadcast 172.27.255.255
inet 192.168.32.1  netmask 255.255.240.0  broadcast 192.168.47.255
inet 172.30.0.1  netmask 255.255.0.0  broadcast 172.30.255.255
inet 172.26.0.1  netmask 255.255.0.0  broadcast 172.26.255.255
inet 172.31.0.1  netmask 255.255.0.0  broadcast 172.31.255.255
inet 172.19.0.1  netmask 255.255.0.0  broadcast 172.19.255.255
inet 172.22.0.1  netmask 255.255.0.0  broadcast 172.22.255.255
inet 172.20.0.1  netmask 255.255.0.0  broadcast 172.20.255.255
inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
inet 10.208.17.2  netmask 255.255.252.0  broadcast 10.208.19.255
inet6 fe80::7329:2093:3dd2:74eb  prefixlen 64  scopeid 0x20<link>
inet 127.0.0.1  netmask 255.0.0.0
inet6 ::1  prefixlen 128  scopeid 0x10<host>
EOF
