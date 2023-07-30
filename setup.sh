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

echo "[~] Starting upgrading system"
upd --full
echo "[+] System upgraded"
