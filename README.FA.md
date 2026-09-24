### cfst-deploy

با یک کلیک CloudflareSpeedTest را روی سرور یا سیستم محلی خود نصب و اجرا کنید.

### قابلیت‌ها

- منوی تعاملی با اسکن سریع و اسکن سفارشی
- تنظیم پارامترهای latency، packet loss، تعداد IP، تعداد تست ping و threadها
- انتخاب پورت TCP با `-tp` و تعداد نتایج خروجی با `-p`
- پشتیبانی از فایل IP، فهرست IP، URL تست دانلود و فیلتر colo
- پشتیبانی از HTTP ping، انتخاب خودکار بهترین IP و حالت debug
- اعتبارسنجی ورودی‌های عددی و بررسی وجود فایل IP
- نمایش دستور نهایی و ذخیره خروجی CSV

### نصب سریع

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/install.sh)
```

### معماری‌های لینوکس پشتیبانی‌شده

نصاب با استفاده از `uname -m` معماری سیستم را تشخیص می‌دهد و فایل رسمی مناسب را از بخش [Releases پروژه CloudflareSpeedTest](https://github.com/XIU2/CloudflareSpeedTest/releases) دانلود می‌کند:

| معماری سیستم | فایل رسمی |
| --- | --- |
| x86 / ۳۲ بیتی | `cfst_linux_386.tar.gz` |
| x86_64 / amd64 | `cfst_linux_amd64.tar.gz` |
| ARM v5 | `cfst_linux_armv5.tar.gz` |
| ARM v6 | `cfst_linux_armv6.tar.gz` |
| ARM v7 | `cfst_linux_armv7.tar.gz` |
| ARM v8 / AArch64 | `cfst_linux_arm64.tar.gz` |
| MIPS | `cfst_linux_mips.tar.gz` |
| MIPS64 | `cfst_linux_mips64.tar.gz` |
| MIPS little-endian | `cfst_linux_mipsle.tar.gz` |
| MIPS64 little-endian | `cfst_linux_mips64le.tar.gz` |

نصاب نام‌های رایج مانند `x86_64`، `i686`، `aarch64`، `armv7l`، `mips` و `mipsel` را به نام فایل رسمی مربوط نگاشت می‌کند.

### اجرای اسکنر

پس از نصب، برای ورود به پوشه درست CFST این کد را اجرا کنید:

```bash
arch=$(uname -m)
case "$arch" in
    x86_64|amd64) arch="amd64" ;;
    i386|i486|i586|i686) arch="386" ;;
    aarch64|arm64) arch="arm64" ;;
    armv5*|arm5*) arch="armv5" ;;
    armv6*|arm6*) arch="armv6" ;;
    armv7*|arm7*) arch="armv7" ;;
    mips64el) arch="mips64le" ;;
    mips64) arch="mips64" ;;
    mipsel) arch="mipsle" ;;
    mips) arch="mips" ;;
    *) echo "معماری پشتیبانی نمی‌شود: $arch"; exit 1 ;;
esac
cd cfst/cfst_linux_${arch}
```

سپس اسکنر را اجرا کنید:

```bash
bash scan.sh
```

در منو:

1. **Quick scan** برای اجرای سریع با تنظیمات پیش‌فرض
2. **Custom scan** برای تنظیم همه پارامترها
3. **Show cfst help** برای نمایش گزینه‌های نسخه نصب‌شده
4. **Exit** برای خروج

> اگر اسکنر را روی VPS اجرا می‌کنید، تعداد threadها را پایین نگه دارید تا از فشار زیاد روی سرور جلوگیری شود.

### برای Termux

```bash
pkg update && pkg upgrade -y && pkg install proot-distro -y && proot-distro install ubuntu && proot-distro login ubuntu
```

### تشکر ویژه

از [xiu2](https://github.com/xiu2) برای ساخت CloudflareSpeedTest تشکر می‌کنیم.
