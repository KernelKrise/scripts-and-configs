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

# install vscode extensions                                                                                                                 <-- TBD
echo "\033[34m[~] installing vscode extensions\033[0m"
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension mgmcdermott.vscode-language-babel

# force vscode to always trust folders 
echo '{"security.workspace.trust.enabled": false}' | jq > $HOME/.config/Code/User/settings.json
echo "\033[32m[+] Forced vscode to always trust folders\033[0m"

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

# xclip for clipboard usage in nvim
sudo apt install xclip -y
echo "\033[32m[+] xclip installed\033[0m"

# set some options to nvim (in cmp plugin. Esc to exit autocomplete menu, Tab to comfirm, Down and Up to navigate)
sed 's/\["<C-e>"\] = cmp\.mapping\.close()/\["<Esc>"\] = cmp.mapping.close()/' -i $HOME/.config/nvim/lua/plugins/configs/cmp.lua
sed 's/\["<CR>"\] = cmp\.mapping\.confirm/\["<Tab>"\] = cmp\.mapping\.confirm' -i $HOME/.config/nvim/lua/plugins/configs/cmp.lua
sed 's/\["<Tab>"\] = cmp\.mapping(function(fallback)/\["<Down>"\] = cmp\.mapping(function(fallback)/' -i $HOME/.config/nvim/lua/plugins/configs/cmp.lua
sed 's/\["<S-Tab>"\] = cmp\.mapping(function(fallback)/\["<Up>"\] = cmp\.mapping(function(fallback)/' -i $HOME/.config/nvim/lua/plugins/configs/cmp.lua
echo "\033[32m[+] nvim cmp config changed\033[0m"

# install python lsp for neovim
sudo apt install -y python3-venv nodejs npm
echo 'LS0tQHR5cGUgQ2hhZHJjQ29uZmlnCiBsb2NhbCBNID0ge30KIE0udWkgPSB7dGhlbWUgPSAnY2F0cHB1Y2Npbid9CiBNLnBsdWdpbnMgPSAiY3VzdG9tLnBsdWdpbnMiCiByZXR1cm4gTQ==' | base64 -d >  $HOME/.config/nvim/lua/custom/chadrc.lua
echo 'bG9jYWwgcGx1Z2lucyA9IHsKICB7CiAgICAiam9zZS1lbGlhcy1hbHZhcmV6L251bGwtbHMubnZpbSIsCiAgICBmdCA9IHsicHl0aG9uIn0sCiAgICBvcHRzID0gZnVuY3Rpb24oKQogICAgICByZXR1cm4gcmVxdWlyZSAiY3VzdG9tLmNvbmZpZ3MubnVsbC1scyIKICAgIGVuZCwKICB9LAogIHsKICAgICJ3aWxsaWFtYm9tYW4vbWFzb24ubnZpbSIsCiAgICBvcHRzID0gewogICAgICBlbnN1cmVfaW5zdGFsbGVkID0gewogICAgICAgICJibGFjayIsCiAgICAgICAgIm15cHkiLAogICAgICAgICJydWZmIiwKICAgICAgICAicHlyaWdodCIsCiAgICAgIH0sCiAgICB9LAogIH0sCiAgewogICAgIm5lb3ZpbS9udmltLWxzcGNvbmZpZyIsCiAgICBjb25maWcgPSBmdW5jdGlvbigpCiAgICAgIHJlcXVpcmUgInBsdWdpbnMuY29uZmlncy5sc3Bjb25maWciCiAgICAgIHJlcXVpcmUgImN1c3RvbS5jb25maWdzLmxzcGNvbmZpZyIKICAgIGVuZCwKICB9LAp9CnJldHVybiBwbHVnaW5zCg==' | base64 -d > $HOME/.config/nvim/lua/custom/plugins.lua
mkdir $HOME/.config/nvim/lua/custom/configs
echo 'bG9jYWwgY29uZmlnID0gcmVxdWlyZSgicGx1Z2lucy5jb25maWdzLmxzcGNvbmZpZyIpCgpsb2NhbCBvbl9hdHRhY2ggPSBjb25maWcub25fYXR0YWNoCmxvY2FsIGNhcGFiaWxpdGllcyA9IGNvbmZpZy5jYXBhYmlsaXRpZXMKCmxvY2FsIGxzcGNvbmZpZyA9IHJlcXVpcmUoImxzcGNvbmZpZyIpCgpsc3Bjb25maWcucHlyaWdodC5zZXR1cCh7CiAgb25fYXR0YWNoID0gb25fYXR0YWNoLAogIGNhcGFiaWxpdGllcyA9IGNhcGFiaWxpdGllcywKICBmaWxldHlwZXMgPSB7InB5dGhvbiJ9LAp9KQ==' | base64 -d > $HOME/.config/nvim/lua/custom/configs/lspconfig.lua
echo 'bG9jYWwgYXVncm91cCA9IHZpbS5hcGkubnZpbV9jcmVhdGVfYXVncm91cCgiTHNwRm9ybWF0dGluZyIsIHt9KQpsb2NhbCBudWxsX2xzID0gcmVxdWlyZSgnbnVsbC1scycpCgpsb2NhbCBvcHRzID0gewogIHNvdXJjZXMgPSB7CiAgICBudWxsX2xzLmJ1aWx0aW5zLmZvcm1hdHRpbmcuYmxhY2ssCiAgICBudWxsX2xzLmJ1aWx0aW5zLmRpYWdub3N0aWNzLm15cHksCiAgICBudWxsX2xzLmJ1aWx0aW5zLmRpYWdub3N0aWNzLnJ1ZmYsCiAgfSwKICBvbl9hdHRhY2ggPSBmdW5jdGlvbihjbGllbnQsIGJ1Zm5yKQogICAgaWYgY2xpZW50LnN1cHBvcnRzX21ldGhvZCgidGV4dERvY3VtZW50L2Zvcm1hdHRpbmciKSB0aGVuCiAgICAgIHZpbS5hcGkubnZpbV9jbGVhcl9hdXRvY21kcyh7CiAgICAgICAgZ3JvdXAgPSBhdWdyb3VwLAogICAgICAgIGJ1ZmZlciA9IGJ1Zm5yLAogICAgICB9KQogICAgICB2aW0uYXBpLm52aW1fY3JlYXRlX2F1dG9jbWQoIkJ1ZldyaXRlUHJlIiwgewogICAgICAgIGdyb3VwID0gYXVncm91cCwKICAgICAgICBidWZmZXIgPSBidWZuciwKICAgICAgICBjYWxsYmFjayA9IGZ1bmN0aW9uKCkKICAgICAgICAgIHZpbS5sc3AuYnVmLmZvcm1hdCh7IGJ1Zm5yID0gYnVmbnIgfSkKICAgICAgICBlbmQsCiAgICAgIH0pCiAgICBlbmQKICBlbmQsCn0KcmV0dXJuIG9wdHM=' | base64 -d > $HOME/.config/nvim/lua/custom/configs/null-ls.lua
nvim -c "MasonInstallAll"
echo "\033[32m[+] LSP for python3 installed\033[0m"
