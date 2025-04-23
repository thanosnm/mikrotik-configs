# 🌐 MikroTik Dual WAN + Guest VLAN (Isolated)

🇬🇷 *English below*

## ⚙️ Δύο WAN με VLAN επισκεπτών (απομονωμένο)

Αυτό το script ρυθμίζει:
- Δύο WAN (ether1 κύριο, ether2 εφεδρικό) με DHCP + αυτόματο failover
- LAN bridge με DHCP server
- Guest VLAN ID 60 (192.168.60.0/24)
- DHCP για το VLAN
- NAT και firewall
- Πλήρης απομόνωση του VLAN από τα LAN + πρόσβαση στον router

### ✅ Οδηγίες
1. Ανέβασε το `mikrotik-dual-wan-guest-vlan60-secure-config.rsc` στο Winbox → Files
2. Εκτέλεσε μέσω terminal:
```shell
/import file-name=mikrotik-dual-wan-guest-vlan60-secure-config.rsc
```

---

## ⚙️ Dual WAN + Guest VLAN (fully isolated)

This script configures:
- Dual WAN (ether1 = main, ether2 = backup) with DHCP & failover
- LAN bridge + DHCP server
- Guest VLAN ID 60 (192.168.60.0/24)
- NAT and DHCP for guest VLAN
- Guest is isolated from private networks and the router

### ✅ Instructions
1. Upload `mikrotik-dual-wan-guest-vlan60-secure-config.rsc` to Winbox → Files
2. Run via terminal:
```shell
/import file-name=mikrotik-dual-wan-guest-vlan60-secure-config.rsc
```

---

## 👤 Author

**Thanos Pournaras**  
🔗 https://thanosnm.github.io

---

## ☕ Support My Work

If you find this useful, you can support me with a coffee:

[![Buy Me A Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=☕&slug=pournarasaa&button_colour=FFDD00&font_colour=000000&font_family=Arial&outline_colour=000000&coffee_colour=ffffff)](https://buymeacoffee.com/pournarasaa)
