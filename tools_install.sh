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
echo -e "${GREEN}[+] pwntools installed${RESET}"

# bloodhound-python
echo -e "${BLUE}[~] Installing bloodhound-python${RESET}"
pip3 install bloodhound
echo -e "${GREEN}[+] bloodhound-python installed${RESET}"

# kerbrute-python
echo -e "${BLUE}[~] Installing kerbrute-python${RESET}"
pip3 install kerbrute
echo -e "${GREEN}[+] kerbrute-python installed${RESET}"

# droopescan
echo -e "${BLUE}[~] Installing droopescan${RESET}"
pip install droopescan
echo -e "${GREEN}[+] droopescan installed${RESET}"

# ngrok
echo -e "${BLUE}[~] Installing ngrok${RESET}"
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
echo -e "${GREEN}[+] ngrok installed${RESET}"

# ROPgadget
echo -e "${BLUE}[~] Installing ROPgadget${RESET}"
sudo apt install python3-pip
sudo -H python3 -m pip install ROPgadget
echo -e "${GREEN}[+] ROPgadget installed${RESET}"

# one_gadget
echo -e "${BLUE}[~] Installing one_gadget${RESET}"
sudo gem install one_gadget
echo -e "${GREEN}[+] one_gadget installed${RESET}"

# pwn_init.py
echo -e "${BLUE}[~] Installing pwn_init.py${RESET}"
wget -q https://raw.githubusercontent.com/KernelKrise/pwn_init/main/pwn_init.py
sudo mv pwn_init.py /usr/bin/pwn_init.py
sudo chmod +x /usr/bin/pwn_init.py
echo -e "${GREEN}[+] pwn_init.py installed${RESET}"

# oletools
echo -e "${BLUE}[~] Installing oletools${RESET}"
pip3 install pyparsing
pip3 install mitmproxy
sudo -H pip3 install -U oletools[full]
echo -e "${GREEN}[+] oletools installed${RESET}"

# z3-solver
echo -e "${BLUE}[~] Installing z3-solver${RESET}"
pip install z3-solver
echo -e "${GREEN}[+] z3-solver installed${RESET}"
