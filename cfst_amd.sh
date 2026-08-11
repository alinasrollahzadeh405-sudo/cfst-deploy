#!/bin/bash

echo "🚀 Starting CFST setup..."

echo "📦 Updating packages and installing dependencies..."
apt update && apt upgrade -y && apt install wget tar -y

echo "📁 Creating and entering 'cfst' directory..."
mkdir -p cfst && cd cfst

echo "⬇️ Downloading CloudflareSpeedTest for AMD64..."
wget -N https://github.com/XIU2/CloudflareSpeedTest/releases/download/v2.3.5/cfst_linux_amd64.tar.gz

echo "📦 Extracting the package..."
tar -xzf cfst_linux_amd64.tar.gz

echo "⚙️ Setting up permissions..."
cd cfst_linux_amd64 && chmod +x cfst
if [ -d "~/cfst" ] ; then
    echo "✅ Installation finished successfully!"
else
    echo "error!"
fi