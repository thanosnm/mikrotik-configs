# 🌐 MikroTik Single WAN + Guest VLAN (Isolated)

🇬🇷 *English below*

## ⚙️ Ρύθμιση MikroTik με 1 WAN και Guest VLAN

Αυτό το script ρυθμίζει:
- Μία θύρα WAN (ether1) με DHCP client
- Bridge για LAN (ether2-10, wlan1/wlan2)
- VLAN 60 για guest δίκτυο (192.168.60.0/24)
- DHCP Server για LAN & Guest
- NAT για internet πρόσβαση
- Πλήρης απομόνωση VLAN από LAN & τον router

### ✅ Οδηγίες
1. Ανέβασε το `mikrotik-single-wan-guest-vlan60-config.rsc` στο Winbox → Files
2. Εκτέλεσε από terminal:
```shell
/import file-name=mikrotik-single-wan-guest-vlan60-config.rsc
```

---

## ⚙️ MikroTik Setup with 1 WAN and Isolated Guest VLAN

This script configures:
- One WAN (ether1) via DHCP client
- Bridge for LAN (ether2-10 + wlan1/2)
- Guest VLAN ID 60 (192.168.60.0/24)
- NAT and DHCP for both LAN & Guest
- Guest VLAN is fully isolated from LAN and the router

### ✅ Instructions
1. Upload `mikrotik-single-wan-guest-vlan60-config.rsc` to Winbox → Files
2. Run from terminal:
```shell
/import file-name=mikrotik-single-wan-guest-vlan60-config.rsc
```

---

## 👤 Author

**Thanos Pournaras**  
🔗 https://thanosnm.github.io

---

## ☕ Support My Work

If you find this useful, you can support me with a coffee:

[![Buy Me A Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=☕&slug=pournarasaa&button_colour=FFDD00&font_colour=000000&font_family=Arial&outline_colour=000000&coffee_colour=ffffff)](https://buymeacoffee.com/pournarasaa)
