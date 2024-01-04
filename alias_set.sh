#!/usr/bin/env bash


RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"


# Add some aliases
echo -e "${BLUE}[~] Setting up aliases${RESET}"
echo -e '\n# Custom config:' >> ~/.zshrc
echo "alias ll='ls -alh'" >> ~/.zshrc
echo "alias pyhttp='python3 -m http.server 9000'" >> ~/.zshrc
echo "alias cme='crackmapexec'" >> ~/.zshrc
echo "alias pch='proxychains -q'" >> ~/.zshrc
echo "alias uenc='jq -sRr @uri'" >> ~/.zshrc
echo -e "${GREEN}[+] Added aliases: ll='ls -alh', pyhttp='python3 -m http.server 9000', cme='crackmapexec', pch='proxychains -q'${RESET}"
