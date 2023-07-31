#!/bin/bash

# update DB to use locate tool
sudo updatedb
echo "\033[32m[+] DB updated, locate tool working well\033[0m"

# set my favourite wallpapers
xfconf-query -c xfce4-desktop -p $(xfconf-query -c xfce4-desktop -l | grep "Virtual" | grep "last-image" | head -n 1) -s $(locate kali-cubism.jpg | head -n 1)
echo "\033[32m[+] Wallpaper was successfully set\033[0m"

# set update tool
sudo -q wget https://raw.githubusercontent.com/KernelKrise/scripts-and-configs/main/upd -O /usr/bin/upd
sudo chmod +x /usr/bin/upd
echo "\033[32m[+] upd tool successfully set\033[0m"

# upgrade system
echo "[~] Starting upgrading system"
upd --full
echo "\033[32m[+] System upgraded\033[0m"

# install tool to add repos to apt
sudo apt install software-properties-common
echo "\033[32m[+] software-properties-common tool installed\033[0m"

# install vscode (and Microsoft key)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo add-apt-repository 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main'
sudo apt install code -y
echo "\033[32m[+] vscode installed\033[0m"

# install jq to parse json
sudo apt install jq -y
echo "\033[32m[+] jq installed\033[0m"

# force vscode to always trust folders 
echo '{"security.workspace.trust.enabled": false}' | jq > $HOME/.config/Code/User/settings.json
echo "\033[32m[+] Forced vscode to always trust folders\033[0m"

# install vscode extensions                                                                                                                 <-- TBD
echo "\033[34m[~] installing vscode extensions\033[0m"
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension mgmcdermott.vscode-language-babel

# Add some aliases
echo -n '\n# Custom config:\n' >> ~/.zshrc
echo "alias ll='ls -alh'" >> ~/.zshrc
echo "alias pyhttp='python3 -m http.server 9000'" >> ~/.zshrc
echo "alias cme='crackmapexec'" >> ~/.zshrc
echo "\033[32m[+] Added aliases: ll='ls -alh', pyhttp='python3 -m http.server 9000', cme='crackmapexec'\033[0m"

# Building neovim
sudo apt install ninja-build gettext cmake -y
echo "\033[32m[+] ninja-build, gettext, cmake installed\033[0m"
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install
