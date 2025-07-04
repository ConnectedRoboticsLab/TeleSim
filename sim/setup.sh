#!/usr/bin/env bash
sudo ip tuntap add mode tap dev tapa
sudo ip tuntap add mode tap dev tapb
sudo ip addr add 192.168.2.20/24 dev tapa
sudo ip addr add 192.168.3.20/24 dev tapb
sudo ip link set dev tapa up
sudo ip link set dev tapb up

