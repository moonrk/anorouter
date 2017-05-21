#! /bin/sh

# Routes traffic from eth0 through tun0 standard NAT on wlan0
# eth0: NAT network
# wlan0: Public network with internet access
# tun0: VPN network

./scripts/reset-routing.sh

iptables-restore < iptables/vpn.conf
./iptables/basic-security.sh
./iptables/basic-services.sh

systemctl start stunnel4
systemctl start openvpn@tun0.service

# Make permanent
iptables-save > /etc/iptables/rules.v4
systemctl enable stunnel4
systemctl enable openvpn@tun0.service
