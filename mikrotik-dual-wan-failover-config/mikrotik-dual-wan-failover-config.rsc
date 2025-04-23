# MikroTik Dual WAN DHCP Failover Configuration
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

:foreach i in={3;4;5;6;7;8;9;10} do={
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

# ------------------- WAN DHCP CLIENTS -------------------
/ip dhcp-client
add interface=ether1 use-peer-dns=no use-peer-ntp=no add-default-route=no disabled=no
add interface=ether2 use-peer-dns=no use-peer-ntp=no add-default-route=no disabled=no

# ------------------- ROUTES -------------------
/ip route
add dst-address=0.0.0.0/0 gateway=ether1 distance=1 check-gateway=ping comment="Primary WAN"
add dst-address=0.0.0.0/0 gateway=ether2 distance=2 check-gateway=ping comment="Backup WAN"

# ------------------- LAN IP -------------------
/ip address add address=$lanAddress interface=$lanBridge comment="LAN Gateway"

# ------------------- DHCP SERVER -------------------
/ip pool add name=dhcp-pool ranges=($dhcpRangeStart . "-" . $dhcpRangeEnd)
/ip dhcp-server add name=dhcp-lan interface=$lanBridge address-pool=dhcp-pool disabled=no
/ip dhcp-server network add address=192.168.20.0/24 gateway=192.168.20.1 dns-server="$dns1,$dns2"

# ------------------- NAT -------------------
/ip firewall nat add chain=srcnat out-interface=ether1 action=masquerade comment="NAT Primary WAN"
/ip firewall nat add chain=srcnat out-interface=ether2 action=masquerade comment="NAT Backup WAN"

# ------------------- FIREWALL -------------------
/ip firewall filter
add chain=input connection-state=established,related action=accept comment="Allow Established/Related"
add chain=input connection-state=invalid action=drop comment="Drop Invalid"
add chain=input in-interface=$lanBridge action=accept comment="Allow LAN Access"
add chain=input in-interface=ether1 action=drop comment="Block WAN1 Access"
add chain=input in-interface=ether2 action=drop comment="Block WAN2 Access"

# ------------------- DNS -------------------
/ip dns set allow-remote-requests=yes servers="$dns1,$dns2"

# ------------------- SERVICES -------------------
/ip service set www disabled=yes
/ip service set telnet disabled=yes
/ip service set ftp disabled=yes
/ip service set ssh address=$allowedAccess
/ip service set winbox address=$allowedAccess

# ------------------- SYSTEM -------------------
/system identity set name="MikroTik-DualWAN"
/system clock set time-zone-name=Europe/Athens

# ------------------- LOGIN BANNER -------------------
/system note
set show-at-login=yes note="MikroTik Dual WAN FailoverPowered by Thanos Pournarashttps://thanosnm.github.io"

# ✅ DONE
