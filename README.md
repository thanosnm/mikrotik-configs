# 🧰 MikroTik Base Configurations

🇬🇷 *English below*

## ⚙️ Βασικά Σενάρια Ρύθμισης MikroTik (v7.12.2+)

Αυτός ο φάκελος περιέχει έτοιμα `.rsc` αρχεία για τυπικές περιπτώσεις ρύθμισης MikroTik:

- 1 WAN DHCP με NAT και DHCP Server
- 2 WAN DHCP με failover (check-gateway)
- Guest VLAN 60 με απομόνωση (address-list + input block)
- IPv6 Dual Stack (DHCPv6-PD + firewall)
- Default wizard-like αρχικό setup με banner

### 🧩 Περιεχόμενα

| Φάκελος/Αρχείο | Περιγραφή |
|----------------|-----------|
| `mikrotik-default-wizard-config.rsc` | Πλήρες αρχικό setup (1 WAN, LAN, DHCP, NAT, firewall) |
| `mikrotik-dual-wan-failover-config.rsc` | Δύο WAN με DHCP και failover |
| `mikrotik-dual-wan-guest-vlan60-config.rsc` | Δύο WAN + Guest VLAN |
| `mikrotik-single-wan-guest-vlan60-config.rsc` | 1 WAN + VLAN επισκεπτών |
| `mikrotik-wan-dual-stack-config.rsc` | IPv4 + IPv6 setup σε WAN |

### ✅ Ελάχιστη έκδοση RouterOS
**7.12.2**

### 🚀 Χρήση
1. Ανέβασε το `.rsc` μέσω Winbox → Files
2. Άνοιξε terminal και τρέξε:
```shell
/import file-name=όνομα.rsc
```

⚠️ *Μην τροποποιήσεις αρχεία αν δεν γνωρίζεις τι κάνουν. Κράτησε backup πριν τη χρήση.*

---

## ⚙️ MikroTik Base Configurations (v7.12.2+)

This folder contains ready `.rsc` configuration scripts for common MikroTik setups:

- 1 WAN DHCP + NAT + DHCP Server
- Dual WAN with failover
- VLAN 60 for guests (fully isolated)
- IPv6 support (DHCPv6-PD, SLAAC, firewall)
- Default configuration wizard-like setup

### 🧩 Contents

| File | Description |
|------|-------------|
| `mikrotik-default-wizard-config.rsc` | Basic setup with bridge, NAT, DHCP, firewall |
| `mikrotik-dual-wan-failover-config.rsc` | Dual WAN with check-gateway failover |
| `mikrotik-dual-wan-guest-vlan60-config.rsc` | Dual WAN + VLAN 60 (guests) |
| `mikrotik-single-wan-guest-vlan60-config.rsc` | Single WAN + Guest VLAN |
| `mikrotik-wan-dual-stack-config.rsc` | Dual Stack WAN (IPv4 + IPv6) |

### ✅ Minimum RouterOS version
**7.12.2**

### 🚀 How to Use
1. Upload `.rsc` via Winbox → Files
2. Open terminal and run:
```shell
/import file-name=name.rsc
```

⚠️ *Always backup your configuration before applying any script.*

---

## 👤 Author

**Thanos Pournaras**  
🔗 https://thanosnm.github.io

---

## ☕ Support My Work

If you found this useful, feel free to support me:

[![Buy Me A Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=☕&slug=pournarasaa&button_colour=FFDD00&font_colour=000000&font_family=Arial&outline_colour=000000&coffee_colour=ffffff)](https://buymeacoffee.com/pournarasaa)
