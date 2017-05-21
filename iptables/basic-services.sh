# Allow loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow ssh
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

# Allow icmp pings
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# Allow DHCP
iptables -A INPUT -i eth0 -p udp -m udp --dport 67:68 -j ACCEPT

# Allow DNS
iptables -A INPUT -i eth0 -p udp -m udp --dport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 53 -j ACCEPT
