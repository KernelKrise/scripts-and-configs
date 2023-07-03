#!/bin/bash

mkdir -p ~/privesc

# pspy
PSPY_VERSION=$(curl -s https://github.com/DominicBreuker/pspy/tags | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | sort -u | tail -n 1)
echo "PSPY VERSION: $PSPY_VERSION"
wget -q https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32 -O ~/privesc/pspy32
wget -q https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64 -O ~/privesc/pspy64
wget -q https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32s -O ~/privesc/pspy32s
wget -q https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64s -O ~/privesc/pspy64s

# lp/wp.sh
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20230702-bc7ce3ac/linpeas.sh -O ~/privesc/lp.sh
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20230702-bc7ce3ac/winPEAS.bat -O ~/privesc/wp.bat

# socat
wget -q https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat -O ~/privesc/socat

chmod +x *
