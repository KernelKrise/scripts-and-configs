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


