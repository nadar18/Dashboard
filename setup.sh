#!/bin/bash

# Load configuration
source "$(dirname "$0")/config.sh"

echo "=== Raspberry Pi Autostart Setup ==="

# Create autostart folder if not exists
AUTOSTART_DIR="$HOME/.config/autostart"
mkdir -p "$AUTOSTART_DIR"

# Copy desktop launcher
cp "$(dirname "$0")/autostart.desktop" "$AUTOSTART_DIR/"
echo "[✓] autostart.desktop copied to $AUTOSTART_DIR"

# Make refresh.sh executable
chmod +x "$(dirname "$0")/refresh.sh"
echo "[✓] refresh.sh marked as executable"

# Optionally install dependencies
read -p "Do you want to install required packages? (y/n): " INSTALL_PKGS
if [[ "$INSTALL_PKGS" == "y" || "$INSTALL_PKGS" == "Y" ]]; then
  sudo apt update
  sudo apt install -y chromium-browser xdotool unclutter matchbox-window-manager lxsession lightdm
fi

# Done
echo "=== Setup complete ==="
echo "Reboot your Raspberry Pi to start the kiosk mode."
