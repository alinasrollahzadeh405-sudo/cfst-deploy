#!/bin/bash

echo "🚀 Starting CFST setup..."

echo "📦 Updating packages and installing dependencies..."
apt update && apt upgrade -y && apt install wget tar -y

echo "🔍 Detecting system architecture..."
arch=$(uname -m)

if [ "$arch" = "x86_64" ]; then
    arch="amd64"
elif [ "$arch" = "aarch64" ] || [ "$arch" = "arm64" ]; then
    arch="arm64"
else
    echo "❌ Unsupported architecture: $arch"
    exit 1
fi

echo "📁 Creating and entering 'cfst' directory..."
mkdir -p cfst && cd cfst

echo "⬇️ Downloading CloudflareSpeedTest for ${arch}..."
wget -N https://github.com/XIU2/CloudflareSpeedTest/releases/latest/download/cfst_linux_${arch}.tar.gz

echo "📦 Extracting the package..."
tar -xzf cfst_linux_${arch}.tar.gz

echo "⚙️ Setting up permissions..."
cd cfst_linux_${arch} && chmod +x cfst && curl -s -o scan.sh "https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/cfst-deploy/main/install.sh" && chmod +x scan.sh

echo "✅ Installation finished successfully!"
