#! /bin/sh

systemctl stop stunnel4
systemctl disable stunnel4

systemctl stop openvpn@tun0.service
systemctl disable openvpn@tun0.service

systemctl stop tor
systemctl disable tor
