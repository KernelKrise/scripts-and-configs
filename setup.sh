#!/bin/bash

# update DB to use locate tool
sudo updatedb
echo "[+] DB updated, locate tool working well"

# set my favourite wallpapers
xfconf-query -c xfce4-desktop -p $(xfconf-query -c xfce4-desktop -l | grep "Virtual" | grep "last-image" | head -n 1) -s $(locate kali-cubism.jpg | head -n 1)
echo "[+] Wallpaper was successfully set"

# set update tool
sudo bash -c "echo 'IyEvYmluL2Jhc2gKc3VkbyBhcHQgdXBkYXRlIC15CgojIENoZWNrIGlmIHRoZSB1c2VyIHByb3ZpZGVkIHRoZSAtLWZ1bGwgYXJndW1lbnQKaWYgW1sgJDEgPT0gIi0tZnVsbCIgXV07IHRoZW4KICBlY2hvICJSdW5uaW5nIGEgZnVsbCBzeXN0ZW0gdXBncmFkZS4uLiIKICBzdWRvIGFwdCBmdWxsLXVwZ3JhZGUgLXkKZWxzZQogIGVjaG8gIllvdSBjYW4gdXNlIC0tZnVsbCBhcmd1bWVudCB0byBwZXJmb3JtIGEgZnVsbCBzeXN0ZW0gdXBncmFkZSIKICAjIHN1ZG8gYXB0IHVwZ3JhZGUgLXkKICBzdWRvIGFwdCBkaXN0LXVwZ3JhZGUgLXkKZmkKCg==' | base64 -d | tee /usr/bin/upd"
sudo chmod +x /usr/bin/upd
echo "[+] upd tool successfully set"

# upgrade system
echo "[~] Starting upgrading system"
upd --full
echo "[+] System upgraded"

# install tool to add repos to apt
sudo apt install software-properties-common
echo "[+] software-properties-common tool installed"

# install vscode (and Microsoft key)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo add-apt-repository 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main'
sudo apt install code -y
echo "[+] vscode installed"

# install jq to parse json
sudo apt install jq -y
echo "[+] jq installed"

# force vscode to always trust folders 
echo '{"security.workspace.trust.enabled": false}' | jq > $HOME/.config/Code/User/settings.json
echo "[+] forced vscode to always trust folders"

# install vscode extensions                                                                                                           <-- TBD
echo "[~] installing vscode extensions"
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension mgmcdermott.vscode-language-babel

