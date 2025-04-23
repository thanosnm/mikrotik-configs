
# MikroTik Single WAN Dual Stack (IPv4 + IPv6) Configuration
# Created by Thanos Pournaras - https://thanosnm.github.io

# ------------------- USER VARIABLES -------------------
:global lanBridge "bridge-lan"
:global lanAddress "192.168.20.1/24"
:global dhcpRangeStart "192.168.20.10"
:global dhcpRangeEnd "192.168.20.254"
:global dns1 "8.8.8.8"
:global dns2 "1.1.1.1"
:global allowedAccess "192.168.20.0/24"

# ------------------- INTERFACES -------------------
/interface bridge add name=$lanBridge

:foreach i in={2;3;4;5;6;7;8;9;10} do={
  :local ethName ("ether" . $i)
  :if ([:len [/interface find where name=$ethName]] > 0) do={
    /interface bridge port add bridge=$lanBridge interface=$ethName
  }
}

:foreach wlan in={"wlan1"; "wlan2"} do={
  :if ([:len [/interface find where name=$wlan]] > 0) do={
    /interface bridge port add bridge=$lanBridge interface=$wlan
  }
}

# ------------------- WAN DHCP CLIENT (IPv4) -------------------
/ip dhcp-client add interface=ether1 use-peer-dns=no use-peer-ntp=no add-default-route=yes disabled=no

# ------------------- LAN IPv4 -------------------
/ip address add address=$lanAddress interface=$lanBridge comment="LAN Gateway"
/ip pool add name=dhcp-pool ranges=($dhcpRangeStart . "-" . $dhcpRangeEnd)
/ip dhcp-server add name=dhcp-lan interface=$lanBridge address-pool=dhcp-pool disabled=no
/ip dhcp-server network add address=192.168.20.0/24 gateway=192.168.20.1 dns-server="$dns1,$dns2"

# ------------------- IPv4 NAT -------------------
/ip firewall nat add chain=srcnat out-interface=ether1 action=masquerade comment="NAT IPv4"

# ------------------- DNS -------------------
/ip dns set allow-remote-requests=yes servers="$dns1,$dns2"

# ------------------- SERVICES -------------------
/ip service set www disabled=yes
/ip service set telnet disabled=yes
/ip service set ftp disabled=yes
/ip service set ssh address=$allowedAccess
/ip service set winbox address=$allowedAccess

# ------------------- IPv6 SETTINGS -------------------
/ipv6 settings set accept-redirects=no accept-router-advertisements=yes

# ------------------- WAN DHCPv6 CLIENT -------------------
/ipv6 dhcp-client add interface=ether1 pool-name=ipv6-pool request=prefix use-peer-dns=no add-default-route=yes

# ------------------- LAN IPv6 ADDRESS -------------------
/ipv6 address add from-pool=ipv6-pool interface=$lanBridge advertise=yes

# ------------------- DNS ADVERTISE -------------------
/ipv6 nd set [find default=yes] advertise-dns=yes

# ------------------- FIREWALL IPv6 -------------------
/ipv6 firewall filter
add chain=input connection-state=established,related action=accept comment="Allow Established"
add chain=input connection-state=invalid action=drop comment="Drop Invalid"
add chain=input protocol=icmpv6 action=accept comment="Allow ICMPv6"
add chain=input in-interface=ether1 action=drop comment="Block WAN IPv6 Access"
add chain=forward connection-state=established,related action=accept
add chain=forward connection-state=invalid action=drop

# ------------------- FIREWALL IPv4 -------------------
/ip firewall filter
add chain=input connection-state=established,related action=accept comment="Allow Established/Related"
add chain=input connection-state=invalid action=drop comment="Drop Invalid"
add chain=input in-interface=$lanBridge action=accept comment="Allow LAN Access"
add chain=input in-interface=ether1 action=drop comment="Block WAN Access"

# ------------------- SYSTEM -------------------
/system identity set name="MikroTik-DualStack"
/system clock set time-zone-name=Europe/Athens

# ------------------- LOGIN BANNER -------------------
/system note
set show-at-login=yes note="MikroTik WAN Dual StackPowered by Thanos Pournarashttps://thanosnm.github.io"

# ✅ DONE
