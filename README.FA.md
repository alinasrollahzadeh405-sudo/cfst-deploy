### cfst-deploy

با یک کلیک CloudflareSpeedTest را روی سرور/سیستم محلی خود نصب و مستقر کنید همراه با یک منوی تعاملی برای اسکنر CloudflareSpeedTest!

### مهم!

در صورتی که این اسکنر را روی VPS خود اجرا می کنید، حتماً تعداد تردها را پایین بیاورید تا سرور شما توسط دیتا سنتر مسدود نشود.

### نصب سریع

برای نصب، از این دستور استفاده کنید

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/install.sh)
```

### چگونه اسکن کنیم؟

### ۱: تغییر دایرکتوری به cfst

برای تغییر دایرکتوری از این دستور استفاده کنید.

```bash
arch=$(uname -m)
    if [ "$arch" = "x86_64" ] ; then
    arch="amd64"
    elif [ "$arch" = "aarch64" ] ; then
arch="arm64"
fi
cd cfst/cfst_linux_${arch}
```

### ۲: با این دستور اسکنر را اجرا کنید.

```bash
bash scan.sh
```

### برای termux، قبل از اجرا این دستور را بزنید

```bash
pkg update && pkg upgrade -y && pkg install proot-distro -y && proot-distro install ubuntu && proot-distro login ubuntu
```

### تشکر ویژه از

[xiu2](https://github.com/xiu2) برای ساخت اسکنر cfst!