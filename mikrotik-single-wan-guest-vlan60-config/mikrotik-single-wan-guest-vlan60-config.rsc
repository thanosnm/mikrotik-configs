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
add interface=ether1 use-peer-dns=no use-peer-ntp=no add-default-route=yes disabled=no

# ------------------- ROUTES -------------------
# Default route handled by DHCP client on ether1

# ------------------- LAN IP -------------------
/ip address add address=$lanAddress interface=$lanBridge comment="LAN Gateway"

# ------------------- DHCP SERVER -------------------
/ip pool add name=dhcp-pool ranges=($dhcpRangeStart . "-" . $dhcpRangeEnd)
/ip dhcp-server add name=dhcp-lan interface=$lanBridge address-pool=dhcp-pool disabled=no
/ip dhcp-server network add address=192.168.20.0/24 gateway=192.168.20.1 dns-server="$dns1,$dns2"

# ------------------- NAT -------------------
/ip firewall nat add chain=srcnat out-interface=ether1 action=masquerade comment="NAT Primary WAN"

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


# ------------------- GUEST VLAN 60 -------------------
/interface vlan add name=vlan60 interface=$lanBridge vlan-id=60 comment="Guest VLAN"
/ip address add address=192.168.60.1/24 interface=vlan60 comment="Guest VLAN Gateway"
/ip pool add name=guest-pool ranges=192.168.60.10-192.168.60.254
/ip dhcp-server add name=dhcp-guest interface=vlan60 address-pool=guest-pool disabled=no
/ip dhcp-server network add address=192.168.60.0/24 gateway=192.168.60.1 dns-server=$dns1,$dns2

# ------------------- GUEST VLAN NAT -------------------
/ip firewall nat add chain=srcnat out-interface=ether1 src-address=192.168.60.0/24 action=masquerade comment="NAT Guest via WAN1"

# ------------------- GUEST VLAN ISOLATION -------------------
/ip firewall filter add chain=forward src-address=192.168.60.0/24 dst-address=192.168.20.0/24 action=drop comment="Isolate Guest from LAN"

# ------------------- GUEST VLAN BLOCK ROUTER ACCESS -------------------
/ip firewall filter add chain=input src-address=192.168.60.0/24 action=drop comment="Block Guest VLAN access to router"
