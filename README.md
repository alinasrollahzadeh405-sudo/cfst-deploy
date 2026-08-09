# 🚀 CFST Deploy

An automated, lightweight deployment script for **CloudflareSpeedTest (CFST)**. This tool helps you quickly download, set up, and run CloudflareSpeedTest on your Linux environment or Termux with a single command.

---

## 📥 Usage (One-Liner Installation)

Depending on your system architecture, choose the appropriate command below and run it directly in your terminal:

### For ARM64 (Termux / Mobile / ARM Servers):
```bash
bash <(curl -s [https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/cfst_arm.sh](https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/cfst_arm.sh))

For AMD64 (Standard Linux Servers / PC):
bash <(curl -s [https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/cfst_amd.sh](https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/cfst_amd.sh))

🛠️ What it does:
 * Updates package lists and installs essential tools (wget, tar).
 * Automatically creates a dedicated cfst directory.
 * Downloads the correct binary package based on your system architecture.
 * Extracts the archive and sets up execution permissions.
📝 License
This project is open-source and available under the GPL-3.0 License.

