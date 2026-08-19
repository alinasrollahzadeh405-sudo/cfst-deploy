### فارسی

[ریدمی فارسی](https://github.com/alinasrollahzadeh405-sudo/cfst-deploy/blob/main/README.FA.md)

### cfst-deploy

install and deploy CloudflareSpeedTest to your server/local system with one click and interactive scanner for CloudflareSpeedTest!

### importent!

only run this scanner to your local system! not your server!

### quick install

to install, use this command:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/install.sh)
```

### how to scan?

### 1: change directory to cfst

enter this command:

```bash
arch=$(uname -m)
    if [ "$arch" = "x86_64" ] ; then
    arch="amd64"
    elif [ "$arch" = "aarch64" ] ; then
arch="arm64"
fi
cd cfst/cfst_linux_${arch}
```

### 2: run scanner

enter this command to run interactive scanner

```bash
bash scan.sh
```

### for termux, use this command before executing:

```bash
pkg update && pkg upgrade -y && pkg install proot-distro -y && proot-distro install ubuntu && proot-distro login ubuntu
```

### special thanks

[xiu2](https://github.com/XIU2) for creating cfst scanner!