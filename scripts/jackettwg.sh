#!/bin/bash

WG_INTERFACE="wg0"
CONTAINER_IP="172.22.0.5"
WG_PEER_IP="192.168.3.6"
CONFIG_FILE="/etc/wireguard/wg0.conf"

function up() {
  sudo ip link add $WG_INTERFACE type wireguard
  sudo ip link set $WG_INTERFACE up
  sudo ip -4 address add $WG_PEER_IP dev $WG_INTERFACE
  sudo ip rule add from $CONTAINER_IP table 200
  sudo ip route add 0.0.0.0/0 via $WG_PEER_IP dev $WG_INTERFACE table 200
  sudo sed -i 's/Address/#Address/' $CONFIG_FILE
  sudo wg setconf $WG_INTERFACE $CONFIG_FILE
}

function down() {
  sudo ip rule del from $CONTAINER_IP table 200
  sudo ip route del 0.0.0.0/0 via $WG_PEER_IP dev $WG_INTERFACE table 200
  sudo sed -i 's/#Address/Address/' $CONFIG_FILE
  sudo ip link set $WG_INTERFACE down
  sudo ip link del $WG_INTERFACE type wireguard
}

if [ "$1" = "up" ]; then
  up;
elif [ "$1" = "down" ]; then
 down;
fi

