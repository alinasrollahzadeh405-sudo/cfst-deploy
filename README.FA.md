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

### اجرای اسکنر

پس از نصب وارد پوشه CFST شوید و اجرا کنید:

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
