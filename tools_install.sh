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

# gdb gef
echo -e "${BLUE}[~] Installing gdb gef${RESET}"
sudo apt install -y gdb
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
echo -e "${GREEN}[+] Gdb gef installed${RESET}"

# ghidra
echo -e "${BLUE}[~] Installing ghidra${RESET}"
sudo apt install -y ghidra
echo -e "${GREEN}[+] ghidra installed${RESET}"

# pwntools
echo -e "${BLUE}[~] Installing pwntools${RESET}"
sudo apt install -y python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools
echo -e "export PATH=\$PATH:${HOME}/.local/bin" >> ~/.zshrc
source ~/.zshrc
echo -e "${GREEN}[+] pwntools installed${RESET}"
