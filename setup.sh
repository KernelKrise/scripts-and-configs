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
echo -e '\n# Custom config:' >> ~/.zshrc
echo "alias ll='ls -alh'" >> ~/.zshrc
echo "alias pyhttp='python3 -m http.server 9000'" >> ~/.zshrc
echo "alias cme='crackmapexec'" >> ~/.zshrc
echo "\033[32m[+] Added aliases: ll='ls -alh', pyhttp='python3 -m http.server 9000', cme='crackmapexec'\033[0m"

# Building neovim
echo "\033[34m[~] installing neovim\033[0m"
sudo apt install ninja-build gettext cmake -y
echo "\033[32m[+] ninja-build, gettext, cmake installed\033[0m"
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install
cd ..
rm -rf neovim
echo "\033[32m[+] nvim installed\033[0m"

# Building nvChad
echo "\033[34m[~] installing nvChad\033[0m"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
echo "\033[32m[+] nvChad installed\033[0m"

# Installing JetBrainsMono Nerd Font
JetBrainsFontVersion=$(curl -s https://github.com/ryanoasis/nerd-fonts/releases/ | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | sort -u | tail -n 1)
echo "\033[34m[~] installing JetBrainsMono Nerd Font version: ${JetBrainsFontVersion}\033[0m"
wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/${JetBrainsFontVersion}/JetBrainsMono.zip"
sudo mkdir /usr/share/fonts/truetype/jetbrains-mono
sudo unzip JetBrainsMono.zip -d /usr/share/fonts/truetype/jetbrains-mono
# add cron job to make terminal not transparent and set new font (on reboot)
crontab -l ; echo '@reboot echo b2xkRm9udD0kKGNhdCAkSE9NRS8uY29uZmlnL3F0ZXJtaW5hbC5vcmcvcXRlcm1pbmFsLmluaSB8IGdyZXAgZm9udEZhbWlseSk7IHNlZCAtaSAicy8kb2xkRm9udC9mb250RmFtaWx5PUpldEJyYWluc01vbm8gTmVyZCBGb250IE1vbm8vIiAkSE9NRS8uY29uZmlnL3F0ZXJtaW5hbC5vcmcvcXRlcm1pbmFsLmluaTsgb2xkVHJhbnNwYXJlbmN5PSQoY2F0ICRIT01FLy5jb25maWcvcXRlcm1pbmFsLm9yZy9xdGVybWluYWwuaW5pIHwgZ3JlcCBBcHBsaWNhdGlvblRyYW5zcGFyZW5jeSk7IHNlZCAtaSAicy8kb2xkVHJhbnNwYXJlbmN5L0FwcGxpY2F0aW9uVHJhbnNwYXJlbmN5PTAvIiAkSE9NRS8uY29uZmlnL3F0ZXJtaW5hbC5vcmcvcXRlcm1pbmFsLmluaTsgY3JvbnRhYiAtcg== | /usr/bin/base64 -d | /usr/bin/bash' | crontab -
echo "\033[32m[+] JetBrains Nerd Font installed. Restart to apply\033[0m"

# add syntax highlighting for some languages
nvim -c "TSInstall html javascript http json json5 php cpp dockerfile"
echo "\033[32m[+] Syntax highlighting for neovim installed\033[0m"
