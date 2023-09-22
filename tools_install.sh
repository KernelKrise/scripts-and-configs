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
sudo apt install -y python3-pip
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

# xxd
echo -e "${BLUE}[~] Installing xxd${RESET}"
sudo apt install -y xxd
echo -e "${GREEN}[+] xxd installed${RESET}"

# recaf
echo -e "${BLUE}[~] Installing recaf${RESET}"
RECAF_VERSION=$(curl -s -i https://github.com/Col-E/Recaf/releases/latest | grep location | awk -F'/' '{print $NF}')
RECAF_VERSION=${RECAF_VERSION::-1}
echo -e "${BLUE}RECAF VERSION: ${RECAF_VERSION}${RESET}"
wget -q "https://github.com/Col-E/Recaf/releases/download/${RECAF_VERSION}/recaf-${RECAF_VERSION}-J8-jar-with-dependencies.jar" -O recaf.jar
sudo mkdir -p /usr/share/recaf
sudo mv recaf.jar /usr/share/recaf/recaf.jar
sudo echo -e '#!/usr/bin/env bash\n\njava -jar /usr/share/recaf/recaf.jar' | sudo tee /usr/bin/recaf
sudo chmod +x /usr/bin/recaf
echo -e "${GREEN}[+] recaf installed${RESET}"

# bytecode viewer
echo -e "${BLUE}[~] Installing bytecode viewer${RESET}"
BYTECODE_VIEWER_VERSION=$(curl -s -i https://github.com/Konloch/bytecode-viewer/releases/latest | grep location | awk -F'/' '{print $NF}')
BYTECODE_VIEWER_VERSION=${BYTECODE_VIEWER_VERSION::-1}
echo -e "${BLUE}BYTECODE VIEWER VERSION: ${BYTECODE_VIEWER_VERSION}${RESET}"
wget -q "https://github.com/Konloch/bytecode-viewer/releases/download/${BYTECODE_VIEWER_VERSION}/Bytecode-Viewer-${BYTECODE_VIEWER_VERSION:1}.jar" -O bytecode_viewer.jar
sudo mkdir -p /usr/share/bytecode_viewer
sudo mv bytecode_viewer.jar /usr/share/bytecode_viewer/bytecode_viewer.jar
sudo echo -e '#!/usr/bin/env bash\n\njava -jar /usr/share/bytecode_viewer/bytecode_viewer.jar' | sudo tee /usr/bin/bytecode_viewer
sudo chmod +x /usr/bin/bytecode_viewer
echo -e "${GREEN}[+] bytecode viewer installed${RESET}"

# IDA Free
echo -e "${BLUE}[~] Downloading IDA Free${RESET}"
wget -q wget https://out7.hex-rays.com/files/idafree83_linux.run -O ~/idafree83_linux.run
chmod +x ~/idafree83_linux.run
echo -e "${GREEN}[+] IDA Free downloaded${RESET}"

# Default Credentials Cheat Sheet
echo -e "${BLUE}[~] Installing Default Credentials Cheat Sheet${RESET}"
pip3 install defaultcreds-cheat-sheet
echo -e "${GREEN}[+] Default Credentials Cheat Sheet installed${RESET}"

# cupp
echo -e "${BLUE}[~] Installing cupp${RESET}"
wget -q https://raw.githubusercontent.com/Mebus/cupp/master/cupp.py
wget -q https://raw.githubusercontent.com/Mebus/cupp/master/cupp.cfg
sudo mkdir -p /usr/share/cupp
sudo mv cupp.py /usr/share/cupp/cupp.py
sudo mv cupp.cfg /usr/share/cupp/cupp.cfg
sudo chmod +x /usr/share/cupp/cupp.py
sudo ln -s /usr/share/cupp/cupp.py /usr/bin/cupp
echo -e "${GREEN}[+] cupp installed${RESET}"

# Username Anarchy
echo -e "${BLUE}[~] Installing Username Anarchy${RESET}"
wget -q https://raw.githubusercontent.com/urbanadventurer/username-anarchy/master/username-anarchy
wget -q https://raw.githubusercontent.com/urbanadventurer/username-anarchy/master/format-plugins.rb
sudo mkdir -p /usr/share/username-anarchy
sudo mv username-anarchy /usr/share/username-anarchy/username-anarchy
sudo mv format-plugins.rb /usr/share/username-anarchy/format-plugins.rb
sudo chmod +x /usr/share/username-anarchy/username-anarchy
sudo sed -i "s/require 'format-plugins\.rb'/require '\/usr\/share\/username-anarchy\/format-plugins\.rb'/" /usr/bin/username-anarchy
sudo ln -s /usr/share/username-anarchy/username-anarchy /usr/bin/username-anarchy
echo -e "${GREEN}[+] Username Anarchy installed${RESET}"

# Default Credentials Cheat Sheet
echo -e "${BLUE}[~] Installing seccomp-tools${RESET}"
sudo gem install seccomp-tools
echo -e "${GREEN}[+] seccomp-tools installed${RESET}"

# Default Credentials Cheat Sheet
echo -e "${BLUE}[~] Installing htop${RESET}"
sudo apt install htop
echo -e "${GREEN}[+] htop installed${RESET}"

