#!/bin/bash

TARGET_FOLDER=~/privesc
echo "TARGET FOLDER: $TARGET_FOLDER"
mkdir -p $TARGET_FOLDER

# pspy
PSPY_VERSION=$(curl -s https://github.com/DominicBreuker/pspy/tags | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | sort -u | tail -n 1)
echo "PSPY VERSION: $PSPY_VERSION"
wget -q https://github.com/DominicBreuker/pspy/releases/download/$PSPY_VERSION/pspy32 -O $TARGET_FOLDER/pspy32
wget -q https://github.com/DominicBreuker/pspy/releases/download/$PSPY_VERSION/pspy64 -O $TARGET_FOLDER/pspy64
wget -q https://github.com/DominicBreuker/pspy/releases/download/$PSPY_VERSION/pspy32s -O $TARGET_FOLDER/pspy32s 
wget -q https://github.com/DominicBreuker/pspy/releases/download/$PSPY_VERSION/pspy64s -O $TARGET_FOLDER/pspy64s 

# lp.sh/wp.bat
wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -O $TARGET_FOLDER/lp.sh
wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/winpeas.bat -O $TARGET_FOLDER/wp.bat

# socat
wget -q https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat -O $TARGET_FOLDER/socat

# chisel
CHISEL_VERSION=$(curl -s https://github.com/jpillora/chisel | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | sort -u | tail -n 1)
echo "CHISEL VERSION: $CHISEL_VERSION"
wget -q https://github.com/jpillora/chisel/releases/download/$CHISEL_VERSION/chisel_${CHISEL_VERSION:1}_linux_amd64.gz -O $TARGET_FOLDER/chisel.gz
gzip -d $TARGET_FOLDER/chisel.gz

chmod +x $TARGET_FOLDER/*
