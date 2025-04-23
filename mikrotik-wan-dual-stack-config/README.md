# 🌐 MikroTik Dual Stack (IPv4 + IPv6) with 1 WAN

🇬🇷 *English below*

## ⚙️ Ρύθμιση MikroTik με IPv4 + IPv6 σε μία σύνδεση WAN

Αυτό το script περιλαμβάνει:
- DHCP Client (IPv4) στο ether1
- DHCPv6 Client με prefix delegation
- Bridge για LAN (ether2-10, wlan1/2)
- IPv6 διευθύνσεις στο LAN μέσω SLAAC
- NAT και firewall για IPv4
- Βασικός firewall για IPv6
- Banner με στοιχεία

### ✅ Οδηγίες
1. Ανέβασε το `mikrotik-wan-dual-stack-config.rsc` στο Winbox → Files
2. Εκτέλεσε στο terminal:
```shell
/import file-name=mikrotik-wan-dual-stack-config.rsc
```

---

## ⚙️ MikroTik IPv4 + IPv6 Dual Stack on Single WAN

This script sets up:
- DHCP Client (IPv4) on ether1
- DHCPv6 Client with prefix delegation
- Bridge for LAN (ether2-10, wlan1/2)
- SLAAC-based IPv6 on LAN
- NAT & firewall for IPv4
- Basic IPv6 firewall
- Login banner with credits

### ✅ Instructions
1. Upload `mikrotik-wan-dual-stack-config.rsc` to Winbox → Files
2. Run in terminal:
```shell
/import file-name=mikrotik-wan-dual-stack-config.rsc
```

---

## 👤 Author

**Thanos Pournaras**  
🔗 https://thanosnm.github.io

---

## ☕ Support My Work

If you find this useful, you can support me with a coffee:

[![Buy Me A Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=☕&slug=pournarasaa&button_colour=FFDD00&font_colour=000000&font_family=Arial&outline_colour=000000&coffee_colour=ffffff)](https://buymeacoffee.com/pournarasaa)
