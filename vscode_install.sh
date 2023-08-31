#!/usr/bin/env bash


RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"

# install jq to parse json
echo -e "${BLUE}[~] Installing jq, software-properties-common${RESET}"
sudo apt install jq software-properties-common -y
echo -e "${GREEN}[+] jq, software-properties-common installed${RESET}"


# install vscode (and Microsoft key)
echo -e "${BLUE}[~] Installing vscode${RESET}"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo add-apt-repository 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main'
sudo apt install code -y
echo -e "${GREEN}[+] vscode installed${RESET}"


# install vscode extensions                                                                                                                 <-- TBD
echo -e "${BLUE}[~] installing vscode extensions${RESET}"
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension mgmcdermott.vscode-language-babel
echo -e "${GREEN}[+] vscode extensions installed${RESET}"


# force vscode to always trust folders 
echo -e "${BLUE}[~] Forcing vscode to always trust folders${RESET}"
mkdir -p $HOME/.config/Code/User
echo '{"security.workspace.trust.enabled": false}' | jq > $HOME/.config/Code/User/settings.json
echo -e "${GREEN}[+] Forced vscode to always trust folders${RESET}"


