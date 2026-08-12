###cfst-deploy

با یک کلیک CloudflareSpeedTest را روی سرور/سیستم محلی خود نصب و مستقر کنید!

### برای termux، ترمینالهای محلی، و سرورهای arm

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/cfst_arm.sh)
```

### برای termux قبل از اجرا این دستور را بزنید

```bash
pkg update && pkg upgrade -y && pkg install proot-distro -y && proot-distro install ubuntu && proot-distro login ubuntu
```

### برای pc و اکثر سرورها
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/cfst_amd.sh)
```

### تشکر ویژه از

[xiu2](https://github.com/xiu2) برای ساخت اسکنر cfst!