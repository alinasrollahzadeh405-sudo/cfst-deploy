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

### Supported Linux architectures

The installer detects `uname -m` and downloads the matching official asset from [CloudflareSpeedTest Releases](https://github.com/XIU2/CloudflareSpeedTest/releases):

| System architecture | Release asset |
| --- | --- |
| x86 / 32-bit | `cfst_linux_386.tar.gz` |
| x86_64 / amd64 | `cfst_linux_amd64.tar.gz` |
| ARM v5 | `cfst_linux_armv5.tar.gz` |
| ARM v6 | `cfst_linux_armv6.tar.gz` |
| ARM v7 | `cfst_linux_armv7.tar.gz` |
| ARM v8 / AArch64 | `cfst_linux_arm64.tar.gz` |
| MIPS | `cfst_linux_mips.tar.gz` |
| MIPS64 | `cfst_linux_mips64.tar.gz` |
| MIPS little-endian | `cfst_linux_mipsle.tar.gz` |
| MIPS64 little-endian | `cfst_linux_mips64le.tar.gz` |

The installer maps common machine names such as `x86_64`, `i686`, `aarch64`, `armv7l`, `mips`, and `mipsel` to the official asset names.

### Run the scanner

After installation, go to the correct CFST directory:

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
    *) echo "Unsupported architecture: $arch"; exit 1 ;;
esac
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
