# 📦 MikroTik Default Configuration

🇬🇷 *English below*

## ⚙️ Προεπιλεγμένη Ρύθμιση Router (Wizard Style)

Αυτό το script εφαρμόζει μια βασική αρχική ρύθμιση για MikroTik router με:
- WAN θύρα (ether1) με DHCP client
- Bridge για όλα τα LAN ports (ether2-10 + wlan1/wlan2)
- DHCP server στο LAN
- NAT, Firewall, DNS, περιορισμένη πρόσβαση διαχείρισης
- Εμφάνιση banner στο terminal

### ✅ Οδηγίες
1. Πήγαινε **System > Scripts** και δημιούργησε ένα νέο script ή κάνε import
2. Φόρτωσε το `mikrotik-default-wizard-config.rsc` από Winbox → Files
3. Εκτέλεσε:  
```shell
/import file-name=mikrotik-default-wizard-config.rsc
```

---

## ⚙️ Default Router Configuration (Wizard Style)

This script applies a basic first-time setup for MikroTik routers:
- WAN port (`ether1`) via DHCP client
- Bridge for all LAN ports (`ether2` to `ether10`, plus `wlan1`, `wlan2`)
- DHCP server on LAN
- NAT, firewall, DNS, restricted access
- Terminal banner on login

### ✅ Instructions
1. Go to **System > Scripts** or use terminal to import
2. Upload `mikrotik-default-wizard-config.rsc` via Winbox → Files
3. Run the following:
```shell
/import file-name=mikrotik-default-wizard-config.rsc
```

---

## 👤 Author

**Thanos Pournaras**  
🔗 https://thanosnm.github.io

---

## ☕ Support My Work

If you find this useful, you can support me with a coffee:

[![Buy Me A Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=☕&slug=pournarasaa&button_colour=FFDD00&font_colour=000000&font_family=Arial&outline_colour=000000&coffee_colour=ffffff)](https://buymeacoffee.com/pournarasaa)
