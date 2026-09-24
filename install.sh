#!/usr/bin/env bash

set -Eeuo pipefail

readonly CFST_REPO="https://github.com/XIU2/CloudflareSpeedTest/releases/latest/download"
readonly SCAN_URL="https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/scan.sh"
readonly INSTALL_DIR="${CFST_DIR:-${PWD}/cfst}"

info() { printf '\033[1;34m%s\033[0m\n' "$*"; }
success() { printf '\033[1;32m%s\033[0m\n' "$*"; }
error() { printf '\033[1;31mError: %s\033[0m\n' "$*" >&2; }

cleanup() {
    [ -n "${ARCHIVE:-}" ] && [ -f "$ARCHIVE" ] && rm -f "$ARCHIVE"
}
trap cleanup EXIT

if [ "${EUID:-$(id -u)}" -eq 0 ]; then
    SUDO=""
elif command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
else
    error "Run as root or install sudo first."
    exit 1
fi

PACKAGE_MANAGER=""
if command -v apt-get >/dev/null 2>&1; then
    PACKAGE_MANAGER="apt"
elif command -v apk >/dev/null 2>&1; then
    PACKAGE_MANAGER="apk"
elif command -v dnf >/dev/null 2>&1; then
    PACKAGE_MANAGER="dnf"
elif command -v yum >/dev/null 2>&1; then
    PACKAGE_MANAGER="yum"
elif command -v pacman >/dev/null 2>&1; then
    PACKAGE_MANAGER="pacman"
elif command -v zypper >/dev/null 2>&1; then
    PACKAGE_MANAGER="zypper"
else
    error "No supported package manager found (apt, apk, dnf, yum, pacman, or zypper)."
    exit 1
fi

install_packages() {
    case "$PACKAGE_MANAGER" in
        apt)
            $SUDO apt-get update
            $SUDO apt-get install -y ca-certificates curl tar wget
            ;;
        apk) $SUDO apk add --no-cache ca-certificates curl tar wget ;;
        dnf) $SUDO dnf install -y ca-certificates curl tar wget ;;
        yum) $SUDO yum install -y ca-certificates curl tar wget ;;
        pacman) $SUDO pacman -Sy --noconfirm ca-certificates curl tar wget ;;
        zypper) $SUDO zypper --non-interactive install ca-certificates curl tar wget ;;
    esac
}

info "Starting CFST setup..."
info "Detected package manager: ${PACKAGE_MANAGER}"

missing=()
for command in tar uname chmod mkdir; do
    command -v "$command" >/dev/null 2>&1 || missing+=("$command")
done
if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
    missing+=("curl or wget")
fi

if [ "${#missing[@]}" -gt 0 ]; then
    info "Installing missing prerequisites: ${missing[*]}"
    install_packages
fi

for command in tar uname chmod mkdir; do
    command -v "$command" >/dev/null 2>&1 || { error "Required command not found: ${command}"; exit 1; }
done

if command -v curl >/dev/null 2>&1; then
    download() { curl -fL --retry 3 --connect-timeout 15 -o "$2" "$1"; }
elif command -v wget >/dev/null 2>&1; then
    download() { wget -O "$2" "$1"; }
else
    error "Neither curl nor wget is available."
    exit 1
fi

info "Detecting system architecture..."
case "$(uname -m)" in
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
    *) error "Unsupported architecture: $(uname -m)"; exit 1 ;;
esac

archive="cfst_linux_${arch}.tar.gz"
ARCHIVE="${INSTALL_DIR}/${archive}"
mkdir -p "$INSTALL_DIR"

info "Downloading CloudflareSpeedTest for ${arch}..."
download "${CFST_REPO}/${archive}" "$ARCHIVE"

info "Extracting package..."
tar -xzf "$ARCHIVE" -C "$INSTALL_DIR"

CFST_PATH="${INSTALL_DIR}/cfst_linux_${arch}"
if [ ! -d "$CFST_PATH" ]; then
    error "Expected extracted directory was not found: ${CFST_PATH}"
    exit 1
fi

chmod +x "${CFST_PATH}/cfst"
SCAN_PATH="${CFST_PATH}/scan.sh"
info "Downloading interactive scanner..."
download "$SCAN_URL" "$SCAN_PATH"
chmod +x "$SCAN_PATH"

success "Installation finished successfully!"
printf 'Run it with:\n  cd %q && ./scan.sh\n' "$CFST_PATH"
