#! /bin/sh

# Routes traffic from eth0 through standard NAT on wlan0
# Make sure ip forwarding is enabled in /etc/sysctl.conf
# eth0: NAT network
# wlan0: Public network with internet access

./scripts/reset-routing.sh
iptables-restore < iptables/nat.conf
./iptables/basic-security.sh
./iptables/basic-services.sh

# Make permanent
iptables-save > /etc/iptables/rules.v4
