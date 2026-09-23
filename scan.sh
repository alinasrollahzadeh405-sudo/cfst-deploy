#!/bin/bash

# Interactive wrapper for CloudflareSpeedTest.
# Press Enter to keep the value shown in brackets.
set -u

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
CFST="${SCRIPT_DIR}/cfst"

if [ ! -x "$CFST" ]; then
    echo "Error: cfst was not found or is not executable in ${SCRIPT_DIR}."
    exit 1
fi

prompt_default() {
    local prompt="$1"
    local default="$2"
    local answer
    read -r -p "${prompt} [${default}]: " answer
    printf '%s' "${answer:-$default}"
}

prompt_optional() {
    local prompt="$1"
    local answer
    read -r -p "${prompt} (press Enter to skip): " answer
    printf '%s' "$answer"
}

add_option() {
    local option="$1"
    local value="$2"
    if [ -n "$value" ]; then
        ARGS+=("$option" "$value")
    fi
}

echo "Welcome to CFST Interactive!"
echo "Configure the scan parameters below."

# Core testing parameters.
max_latency=$(prompt_default "Maximum latency in ms (-tl)" "200")
min_latency=$(prompt_optional "Minimum latency in ms (-tll)")
packet_loss=$(prompt_optional "Maximum packet loss rate (-tlr)")
download_count=$(prompt_default "How many IPs should be download-tested (-dn)" "10")
ping_count=$(prompt_default "Ping tests per IP (-t)" "4")
thread_count=$(prompt_default "Concurrent test threads (-n)" "100")
download_threads=$(prompt_optional "Download-test threads (-dt)")
min_speed=$(prompt_optional "Minimum download speed in MB/s (-sl)")
port=$(prompt_default "TCP handshake port (-p)" "443")

# Input and output parameters.
ip_file=$(prompt_optional "Input IP/CIDR file (-f)")
ip_list=$(prompt_optional "IP/CIDR list, comma-separated (-ip)")
test_url=$(prompt_optional "Download test URL (-url)")
output_file=$(prompt_default "Output CSV file (-o)" "result.csv")
colo=$(prompt_optional "Cloudflare colo code filter (-cfcolo)")

# Optional switches.
httping=$(prompt_default "Use HTTP ping instead of TCP ping? (y/N)" "N")
debug=$(prompt_default "Enable debug output? (y/N)" "N")

ARGS=("-tl" "$max_latency" "-dn" "$download_count" "-t" "$ping_count" "-n" "$thread_count" "-p" "$port")
add_option "-tll" "$min_latency"
add_option "-tlr" "$packet_loss"
add_option "-dt" "$download_threads"
add_option "-sl" "$min_speed"
add_option "-f" "$ip_file"
add_option "-ip" "$ip_list"
add_option "-url" "$test_url"
add_option "-o" "$output_file"
add_option "-cfcolo" "$colo"

case "$httping" in
    [Yy]|[Yy][Ee][Ss]) ARGS+=("-httping") ;;
esac

case "$debug" in
    [Yy]|[Yy][Ee][Ss]) ARGS+=("-debug") ;;
esac

echo
echo "Starting scan..."
printf 'Running: %q' "$CFST"
printf ' %q' "${ARGS[@]}"
printf '\n\n'
"$CFST" "${ARGS[@]}"
