# Raspberry Pi Autostart Kiosk

This project sets up a Raspberry Pi to automatically launch a Chromium browser in kiosk mode and rotate between predefined tabs using `xdotool`. It supports:

- Raspberry Pi 5
- Raspberry Pi 3 Model B+

---

## 🔧 Features

- Automatic start of Chromium in kiosk mode at boot
- Tab switching with configurable coordinates
- Logging to track tab activity
- Simple setup using `setup.sh`
- Works with GUI-enabled Raspberry Pi OS

---

## Enable Remote Access (VNC)

To remotely access the Raspberry Pi GUI (especially useful for kiosk debugging), you can enable VNC:

1. Open Raspberry Pi configuration:

sudo raspi-config
	3. Interface Options
	I3. VNC
	Yes 
	OK
	Finish
sudo reboot


## Requirements

Make sure the following are installed on your Raspberry Pi:

sudo apt update
sudo apt install -y \
  chromium-browser \
  xdotool \
  unclutter \
  matchbox-window-manager \
  lxsession \
  lightdm
  


## run 

git clone https://github.com/user/raspi-autostart.git
cd raspi-autostart
chmod +x setup.sh
./setup.sh

