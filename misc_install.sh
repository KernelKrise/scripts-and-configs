#!/usr/bin/env bash


RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"


# update DB to use locate tool
echo -e "${BLUE}[~] updating DB${RESET}"
sudo updatedb
echo -e "${GREEN}[+] DB updated, locate tool working well${RESET}"


# set my favourite wallpapers
echo -e "${BLUE}[~] Changing wallpapers${RESET}"
xfconf-query -c xfce4-desktop -p $(xfconf-query -c xfce4-desktop -l | grep "Virtual" | grep "last-image" | head -n 1) -s $(locate kali-cubism.jpg | head -n 1)
echo -e "${GREEN}[+] Wallpaper was successfully set${RESET}"


# set update tool
echo -e "${BLUE}[~] Installing updating tool${RESET}"
sudo -q wget https://raw.githubusercontent.com/KernelKrise/scripts-and-configs/main/upd -O /usr/bin/upd
sudo chmod +x /usr/bin/upd
echo -e "${GREEN}[+] 'upd' tool installed${RESET}"


# upgrade system
echo -e "${BLUE}[~] Starting upgrading system${RESET}"
upd --full
echo -e "${GREEN}[+] System upgraded${RESET}"


# Installing JetBrainsMono Nerd Font
JetBrainsFontVersion=$(curl -s https://github.com/ryanoasis/nerd-fonts/releases/ | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | sort -u | tail -n 1)
echo -e "${BLUE}[~] installing JetBrainsMono Nerd Font version: ${JetBrainsFontVersion}${RESET}"
wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/${JetBrainsFontVersion}/JetBrainsMono.zip"
sudo mkdir /usr/share/fonts/truetype/jetbrains-mono
sudo unzip JetBrainsMono.zip -d /usr/share/fonts/truetype/jetbrains-mono
# add cron job to make terminal not transparent and set new font (on reboot)
crontab -l ; echo '@reboot echo b2xkRm9udD0kKGNhdCAkSE9NRS8uY29uZmlnL3F0ZXJtaW5hbC5vcmcvcXRlcm1pbmFsLmluaSB8IGdyZXAgZm9udEZhbWlseSk7IHNlZCAtaSAicy8kb2xkRm9udC9mb250RmFtaWx5PUpldEJyYWluc01vbm8gTmVyZCBGb250IE1vbm8vIiAkSE9NRS8uY29uZmlnL3F0ZXJtaW5hbC5vcmcvcXRlcm1pbmFsLmluaTsgb2xkVHJhbnNwYXJlbmN5PSQoY2F0ICRIT01FLy5jb25maWcvcXRlcm1pbmFsLm9yZy9xdGVybWluYWwuaW5pIHwgZ3JlcCBBcHBsaWNhdGlvblRyYW5zcGFyZW5jeSk7IHNlZCAtaSAicy8kb2xkVHJhbnNwYXJlbmN5L0FwcGxpY2F0aW9uVHJhbnNwYXJlbmN5PTAvIiAkSE9NRS8uY29uZmlnL3F0ZXJtaW5hbC5vcmcvcXRlcm1pbmFsLmluaTsgY3JvbnRhYiAtcg== | /usr/bin/base64 -d | /usr/bin/bash' | crontab -
echo -e "${GREEN}[+] JetBrains Nerd Font installed. Restart to apply${RESET}"


