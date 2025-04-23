# 🌐 MikroTik Dual WAN DHCP Failover

🇬🇷 *English below*

## ⚙️ Αυτόματη Εναλλαγή WAN (Failover)

Αυτό το script ρυθμίζει το MikroTik router με δύο WAN (ether1, ether2) και failover με `check-gateway=ping`.

- ether1 = Πρωτεύον WAN
- ether2 = Εναλλακτικό WAN (backup)
- DHCP Client και στα δύο
- NAT και firewall έτοιμο
- Περιορισμός πρόσβασης Winbox/SSH
- Banner με πληροφορίες στο login

### ✅ Οδηγίες
1. Ανέβασε το `mikrotik-dual-wan-failover-config.rsc` από Winbox → Files
2. Άνοιξε terminal και εκτέλεσε:
```shell
/import file-name=mikrotik-dual-wan-failover-config.rsc
```

---

## ⚙️ Dual WAN Failover (MikroTik DHCP Setup)

This script configures your MikroTik router with 2 WAN ports (ether1 + ether2) and automatic failover.

- ether1 = Primary WAN
- ether2 = Backup WAN
- Both use DHCP Client
- NAT + firewall preconfigured
- Limited access (Winbox, SSH)
- Login banner with author info

### ✅ Instructions
1. Upload `mikrotik-dual-wan-failover-config.rsc` via Winbox → Files
2. Open terminal and run:
```shell
/import file-name=mikrotik-dual-wan-failover-config.rsc
```

---

## 👤 Author

**Thanos Pournaras**  
🔗 https://thanosnm.github.io

---

## ☕ Support My Work

If you find this useful, you can support me with a coffee:

[![Buy Me A Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=☕&slug=pournarasaa&button_colour=FFDD00&font_colour=000000&font_family=Arial&outline_colour=000000&coffee_colour=ffffff)](https://buymeacoffee.com/pournarasaa)
