#!/usr/bin/env bash


RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"

# update
echo -e "${BLUE}[~] Updating apt${RESET}"
sudo apt -y update
echo -e "${GREEN}[+] apt updated${RESET}"


# bloodhound
echo -e "${BLUE}[~] Installing bloodhound${RESET}"
sudo apt -y install bloodhound
echo -e "${GREEN}[+] Bloodhound installed${RESET}"

# docker 
echo -e "${BLUE}[~] Installing docker${RESET}"
sudo apt install -y docker.io
echo -e "${GREEN}[+] Docker installed${RESET}"

