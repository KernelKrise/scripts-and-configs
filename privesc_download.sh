#!/bin/bash

TARGET_FOLDER=~/privesc
echo "TARGET FOLDER: $TARGET_FOLDER"
rm -rf $TARGET_FOLDER
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
wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64.exe -O $TARGET_FOLDER/wp64.exe
wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx86.exe -O $TARGET_FOLDER/wp32.exe

# socat
wget -q https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat -O $TARGET_FOLDER/socat

# chisel
CHISEL_VERSION=$(curl -s https://github.com/jpillora/chisel | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | sort -u | tail -n 1)
echo "CHISEL VERSION: $CHISEL_VERSION"
wget -q https://github.com/jpillora/chisel/releases/download/$CHISEL_VERSION/chisel_${CHISEL_VERSION:1}_linux_amd64.gz -O $TARGET_FOLDER/chisel.gz
gzip -d $TARGET_FOLDER/chisel.gz

# PowerView.ps1 / SharpView.exe
wget -q https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/dev/Recon/PowerView.ps1 -O $TARGET_FOLDER/PowerView.ps1
wget -q https://github.com/tevora-threat/SharpView/raw/master/Compiled/SharpView.exe-O $TARGET_FOLDER/SharpView.ps1 

# Rubeus.exe
wget -q https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Rubeus.exe -O $TARGET_FOLDER/Rubeus.exe

# Inveigh.ps1 / Inveigh.exe
wget -q https://raw.githubusercontent.com/Kevin-Robertson/Inveigh/master/Inveigh.ps1 -O $TARGET_FOLDER/Inveigh.ps1
INVEIGHEXE_VERSION=$(curl -s https://github.com/Kevin-Robertson/Inveigh/releases/ | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
echo "INVEIGH.EXE VERSION: $INVEIGHEXE_VERSION"
wget -q "https://github.com/Kevin-Robertson/Inveigh/releases/download/${INVEIGHEXE_VERSION}/Inveigh-net7.0-win-x64-trimmed-single-${INVEIGHEXE_VERSION}.zip" -O $TARGET_FOLDER/Inveigh.zip 
unzip $TARGET_FOLDER/Inveigh.zip -d $TARGET_FOLDER/
rm $TARGET_FOLDER/Inveigh.zip $TARGET_FOLDER/Inveigh.pdb


chmod +x $TARGET_FOLDER/*
