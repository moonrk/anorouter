# Block null packets
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# Block syn-flood attacks
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# Block XMAS packets
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

# Block everything else
iptables -P INPUT DROP
