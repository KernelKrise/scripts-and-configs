#!/usr/bin/env bash


RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"


# Building neovim
echo -e "${BLUE}[~] Installing neovim${RESET}"
sudo apt install ninja-build gettext cmake -y
echo -e "${GREEN}[+] ninja-build, gettext, cmake installed${RESET}"
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install
cd ..
rm -rf neovim
echo -e "${GREEN}[+] nvim installed${RESET}"

# Building nvChad
echo -e "${BLUE}[~] installing nvChad${RESET}"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
echo -e "${GREEN}[+] nvChad installed${RESET}"


# add syntax highlighting for some languages
echo -e "${BLUE}[~] Adding syntax highlighting${RESET}"
nvim -c "TSInstall html javascript http json json5 php cpp dockerfile"
echo -e "${GREEN}[+] Syntax highlighting for neovim installed${RESET}"

# xclip for clipboard usage in nvim
echo -e "${BLUE}[~] Installing xclip${RESET}"
sudo apt install xclip -y
echo -e "${GREEN}[+] xclip installed${RESET}"

# set some options to nvim (in cmp plugin. Esc to exit autocomplete menu, Tab to comfirm, Down and Up to navigate)
echo -e "${BLUE}[~] Setting up cmp keyboard settings${RESET}"
sed 's/\["<C-e>"\] = cmp\.mapping\.close()/\["<Esc>"\] = cmp.mapping.close()/' -i $HOME/.config/nvim/lua/plugins/configs/cmp.lua
sed 's/\["<CR>"\] = cmp\.mapping\.confirm/\["<Tab>"\] = cmp\.mapping\.confirm/' -i $HOME/.config/nvim/lua/plugins/configs/cmp.lua
sed 's/\["<Tab>"\] = cmp\.mapping(function(fallback)/\["<Down>"\] = cmp\.mapping(function(fallback)/' -i $HOME/.config/nvim/lua/plugins/configs/cmp.lua
sed 's/\["<S-Tab>"\] = cmp\.mapping(function(fallback)/\["<Up>"\] = cmp\.mapping(function(fallback)/' -i $HOME/.config/nvim/lua/plugins/configs/cmp.lua
echo -e "${GREEN}[+] nvim cmp config changed${RESET}"

# install python lsp for neovim
echo -e "${BLUE}[~] Installing python3 LSP for neovim${RESET}"
sudo apt install -y python3-venv nodejs npm
echo 'LS0tQHR5cGUgQ2hhZHJjQ29uZmlnCiBsb2NhbCBNID0ge30KIE0udWkgPSB7dGhlbWUgPSAnY2F0cHB1Y2Npbid9CiBNLnBsdWdpbnMgPSAiY3VzdG9tLnBsdWdpbnMiCiByZXR1cm4gTQ==' | base64 -d >  $HOME/.config/nvim/lua/custom/chadrc.lua
echo 'bG9jYWwgcGx1Z2lucyA9IHsKICB7CiAgICAiam9zZS1lbGlhcy1hbHZhcmV6L251bGwtbHMubnZpbSIsCiAgICBmdCA9IHsicHl0aG9uIn0sCiAgICBvcHRzID0gZnVuY3Rpb24oKQogICAgICByZXR1cm4gcmVxdWlyZSAiY3VzdG9tLmNvbmZpZ3MubnVsbC1scyIKICAgIGVuZCwKICB9LAogIHsKICAgICJ3aWxsaWFtYm9tYW4vbWFzb24ubnZpbSIsCiAgICBvcHRzID0gewogICAgICBlbnN1cmVfaW5zdGFsbGVkID0gewogICAgICAgICJibGFjayIsCiAgICAgICAgIm15cHkiLAogICAgICAgICJydWZmIiwKICAgICAgICAicHlyaWdodCIsCiAgICAgIH0sCiAgICB9LAogIH0sCiAgewogICAgIm5lb3ZpbS9udmltLWxzcGNvbmZpZyIsCiAgICBjb25maWcgPSBmdW5jdGlvbigpCiAgICAgIHJlcXVpcmUgInBsdWdpbnMuY29uZmlncy5sc3Bjb25maWciCiAgICAgIHJlcXVpcmUgImN1c3RvbS5jb25maWdzLmxzcGNvbmZpZyIKICAgIGVuZCwKICB9LAp9CnJldHVybiBwbHVnaW5zCg==' | base64 -d > $HOME/.config/nvim/lua/custom/plugins.lua
mkdir $HOME/.config/nvim/lua/custom/configs
echo 'bG9jYWwgY29uZmlnID0gcmVxdWlyZSgicGx1Z2lucy5jb25maWdzLmxzcGNvbmZpZyIpCgpsb2NhbCBvbl9hdHRhY2ggPSBjb25maWcub25fYXR0YWNoCmxvY2FsIGNhcGFiaWxpdGllcyA9IGNvbmZpZy5jYXBhYmlsaXRpZXMKCmxvY2FsIGxzcGNvbmZpZyA9IHJlcXVpcmUoImxzcGNvbmZpZyIpCgpsc3Bjb25maWcucHlyaWdodC5zZXR1cCh7CiAgb25fYXR0YWNoID0gb25fYXR0YWNoLAogIGNhcGFiaWxpdGllcyA9IGNhcGFiaWxpdGllcywKICBmaWxldHlwZXMgPSB7InB5dGhvbiJ9LAp9KQ==' | base64 -d > $HOME/.config/nvim/lua/custom/configs/lspconfig.lua
echo 'bG9jYWwgYXVncm91cCA9IHZpbS5hcGkubnZpbV9jcmVhdGVfYXVncm91cCgiTHNwRm9ybWF0dGluZyIsIHt9KQpsb2NhbCBudWxsX2xzID0gcmVxdWlyZSgnbnVsbC1scycpCgpsb2NhbCBvcHRzID0gewogIHNvdXJjZXMgPSB7CiAgICBudWxsX2xzLmJ1aWx0aW5zLmZvcm1hdHRpbmcuYmxhY2ssCiAgICBudWxsX2xzLmJ1aWx0aW5zLmRpYWdub3N0aWNzLm15cHksCiAgICBudWxsX2xzLmJ1aWx0aW5zLmRpYWdub3N0aWNzLnJ1ZmYsCiAgfSwKICBvbl9hdHRhY2ggPSBmdW5jdGlvbihjbGllbnQsIGJ1Zm5yKQogICAgaWYgY2xpZW50LnN1cHBvcnRzX21ldGhvZCgidGV4dERvY3VtZW50L2Zvcm1hdHRpbmciKSB0aGVuCiAgICAgIHZpbS5hcGkubnZpbV9jbGVhcl9hdXRvY21kcyh7CiAgICAgICAgZ3JvdXAgPSBhdWdyb3VwLAogICAgICAgIGJ1ZmZlciA9IGJ1Zm5yLAogICAgICB9KQogICAgICB2aW0uYXBpLm52aW1fY3JlYXRlX2F1dG9jbWQoIkJ1ZldyaXRlUHJlIiwgewogICAgICAgIGdyb3VwID0gYXVncm91cCwKICAgICAgICBidWZmZXIgPSBidWZuciwKICAgICAgICBjYWxsYmFjayA9IGZ1bmN0aW9uKCkKICAgICAgICAgIHZpbS5sc3AuYnVmLmZvcm1hdCh7IGJ1Zm5yID0gYnVmbnIgfSkKICAgICAgICBlbmQsCiAgICAgIH0pCiAgICBlbmQKICBlbmQsCn0KcmV0dXJuIG9wdHM=' | base64 -d > $HOME/.config/nvim/lua/custom/configs/null-ls.lua
nvim -c "MasonInstallAll"
echo -e "${GREEN}[+] LSP for python3 installed${RESET}"
