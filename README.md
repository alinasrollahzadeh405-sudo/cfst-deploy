### cfst-deploy

Install and deploy CloudflareSpeedTest to your server or local system with an interactive scanner.

### Features

- Interactive menu with quick and custom scan modes
- Configure latency, packet loss, IP count, ping tests, and thread counts
- Configure TCP test port (`-tp`) and printed result count (`-p`)
- Support for IP files, direct IP lists, download URLs, and colo filtering
- Optional HTTP ping, automatic best-IP selection, and debug mode
- Numeric input validation and input-file existence checks
- Displays the final command and reports the CSV output path

### Quick install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/install.sh)
```

### Run the scanner

After installation, go to the cfst directory:

```bash
arch=$(uname -m)
if [ "$arch" = "x86_64" ]; then
    arch="amd64"
elif [ "$arch" = "aarch64" ] || [ "$arch" = "arm64" ]; then
    arch="arm64"
fi
cd cfst/cfst_linux_${arch}
```

Then run:

```bash
bash scan.sh
```

The menu provides:

1. **Quick scan** with sensible defaults
2. **Custom scan** with all supported wrapper parameters
3. **Show cfst help** for the installed binary version
4. **Exit**

> When running on a VPS, keep the thread count low to avoid excessive load on the server.

### Termux

```bash
pkg update && pkg upgrade -y && pkg install proot-distro -y && proot-distro install ubuntu && proot-distro login ubuntu
```

### Special thanks

Thanks to [xiu2](https://github.com/xiu2) for creating CloudflareSpeedTest.
