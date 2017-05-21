#! /bin/sh

# Routes traffic from eth0 through tor on wlan0
# eth0: NAT network
# wlan0: Public network with internet access

# All the tcp traffic and DNS requests from eth0 are routed through the tor network.
# Other protocols such as ICMP and UDP are dropped.

./scripts/reset-routing.sh

iptables-restore < iptables/tor-only.conf
./iptables/basic-security.sh
./iptables/basic-services.sh

systemctl start tor

# Make permanent
iptables-save > /etc/iptables/rules.v4
systemctl enable tor
