#!/bin/bash


RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"


TARGET_FOLDER=~/privesc
echo -e "TARGET FOLDER: $TARGET_FOLDER"
rm -rf $TARGET_FOLDER
mkdir -p $TARGET_FOLDER/{windows,linux}


# pspy
PSPY_VERSION=$(curl -s https://github.com/DominicBreuker/pspy/tags | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | sort -u | tail -n 1)
echo -e "${GREEN}Downloading pspy...${RESET}"
echo -e "${BLUE}PSPY VERSION: $PSPY_VERSION ${RESET}"
wget -q https://github.com/DominicBreuker/pspy/releases/download/$PSPY_VERSION/pspy32 -O $TARGET_FOLDER/linux/pspy32
wget -q https://github.com/DominicBreuker/pspy/releases/download/$PSPY_VERSION/pspy64 -O $TARGET_FOLDER/linux/pspy64
wget -q https://github.com/DominicBreuker/pspy/releases/download/$PSPY_VERSION/pspy32s -O $TARGET_FOLDER/linux/pspy32s 
wget -q https://github.com/DominicBreuker/pspy/releases/download/$PSPY_VERSION/pspy64s -O $TARGET_FOLDER/linux/pspy64s 


# linPEAS/WinPEAS
echo -e "${GREEN}Downloading linPEAS/winPEAS...${RESET}"
wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -O $TARGET_FOLDER/linux/lp.sh
wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/winpeas.bat -O $TARGET_FOLDER/windows/wp.bat
wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64.exe -O $TARGET_FOLDER/windows/wp64.exe
wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx86.exe -O $TARGET_FOLDER/windows/wp32.exe
wget -q https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-winPEAS.ps1 -O $TARGET_FOLDER/windows/Invoke-winPEAS.ps1


# socat
echo -e "${GREEN}Downloading socat...${RESET}"
wget -q https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat -O $TARGET_FOLDER/linux/socat


# chisel
echo -e "${GREEN}Downloading chisel...${RESET}"
CHISEL_VERSION=$(curl -s https://github.com/jpillora/chisel | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | sort -u | tail -n 1)
echo -e "${BLUE}CHISEL VERSION: $CHISEL_VERSION ${RESET}"
wget -q https://github.com/jpillora/chisel/releases/download/$CHISEL_VERSION/chisel_${CHISEL_VERSION:1}_linux_amd64.gz -O $TARGET_FOLDER/linux/chisel.gz
wget -q https://github.com/jpillora/chisel/releases/download/$CHISEL_VERSION/chisel_${CHISEL_VERSION:1}_windows_amd64.gz -O $TARGET_FOLDER/windows/chisel.exe.gz 
gzip -d $TARGET_FOLDER/linux/chisel.gz
gzip -d $TARGET_FOLDER/windows/chisel.exe.gz


# PowerView.ps1 / SharpView.exe
echo -e "${GREEN}Downloading PowerView/SharpView...${RESET}"
wget -q https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/dev/Recon/PowerView.ps1 -O $TARGET_FOLDER/windows/PowerView.ps1
wget -q https://github.com/tevora-threat/SharpView/raw/master/Compiled/SharpView.exe-O $TARGET_FOLDER/windows/SharpView.ps1 


# Rubeus.exe
echo -e "${GREEN}Downloading Rubeus...${RESET}"
wget -q https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Rubeus.exe -O $TARGET_FOLDER/windows/Rubeus.exe


# Inveigh.ps1 / Inveigh.exe
echo -e "${GREEN}Downloading Inveigh...${RESET}"
wget -q https://raw.githubusercontent.com/Kevin-Robertson/Inveigh/master/Inveigh.ps1 -O $TARGET_FOLDER/windows/Inveigh.ps1
INVEIGHEXE_VERSION=$(curl -s https://github.com/Kevin-Robertson/Inveigh/releases/ | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
echo -e "${BLUE}INVEIGH.EXE VERSION: $INVEIGHEXE_VERSION ${RESET}"
wget -q "https://github.com/Kevin-Robertson/Inveigh/releases/download/${INVEIGHEXE_VERSION}/Inveigh-net7.0-win-x64-trimmed-single-${INVEIGHEXE_VERSION}.zip" -O $TARGET_FOLDER/windows/Inveigh.zip 
unzip $TARGET_FOLDER/windows/Inveigh.zip -d $TARGET_FOLDER/windows/
rm $TARGET_FOLDER/windows/Inveigh.zip $TARGET_FOLDER/windows/Inveigh.pdb


# LaZagne.exe
echo -e "${GREEN}Downloading LaZagne...${RESET}"
LAZAGNE_VERSION=$(curl -s https://github.com/AlessandroZ/LaZagne/releases | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
wget -q https://github.com/AlessandroZ/LaZagne/releases/download/$LAZAGNE_VERSION/LaZagne.exe -O $TARGET_FOLDER/windows/LaZagne.exe


# SharpHound
echo -e "${GREEN}Downloading SharpHound...${RESET}"
wget -q https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.ps1 -O $TARGET_FOLDER/windows/SharpHound.ps1
SHARPHOUND_EXE_VERSION=$(curl -s https://github.com/BloodHoundAD/SharpHound/releases | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
echo -e "${BLUE}SHARPHOUND.EXE VERSION: ${SHARPHOUND_EXE_VERSION} ${RESET}"
wget -q https://github.com/BloodHoundAD/SharpHound/releases/download/v2.0.0/SharpHound-v2.0.0.zip -O $TARGET_FOLDER/windows/SharpHound.zip
unzip $TARGET_FOLDER/windows/SharpHound.zip SharpHound.exe -d $TARGET_FOLDER/windows/
rm -rf $TARGET_FOLDER/windows/SharpHound.zip


# mimikatz.exe
echo -e "${GREEN}Downloading mimikatz...${RESET}"
wget -q https://github.com/ParrotSec/mimikatz/raw/master/x64/mimikatz.exe -O $TARGET_FOLDER/windows/mimikatz.exe
wget -q https://raw.githubusercontent.com/g4uss47/Invoke-Mimikatz/master/Invoke-Mimikatz.ps1 -O $TARGET_FOLDER/windows/Invoke-Mimikatz.ps1


# accesschk.exe
echo -e "${GREEN}Downloading accesschk...${RESET}"
wget -q https://live.sysinternals.com/accesschk.exe -O $TARGET_FOLDER/windows/accesschk.exe


#p0wny shell
echo -e "${GREEN}Downloading p0wny shell...${RESET}"
wget -q https://raw.githubusercontent.com/flozz/p0wny-shell/master/shell.php -O $TARGET_FOLDER/linux/shell.php


# PowerSharpPack
echo -e "${GREEN}Downloading PowerSharpPack...${RESET}"
wget -q https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpPack.ps1 -O $TARGET_FOLDER/windows/PowerSharpPack.ps1


# ProcDump
echo -e "${GREEN}Downloading ProcDump...${RESET}"
wget -q https://download.sysinternals.com/files/Procdump.zip -O $TARGET_FOLDER/windows/Procdump.zip
unzip $TARGET_FOLDER/windows/Procdump.zip procdump.exe -d $TARGET_FOLDER/windows/
rm $TARGET_FOLDER/windows/Procdump.zip

# Making files executable
chmod +x $TARGET_FOLDER/windows/*
chmod +x $TARGET_FOLDER/linux/*


# tree command
if ! command -v tree &> /dev/null; then
   echo -e "${RED}The 'tree' command is not installed. Install it with your package manager for a nice output of all downloaded utilities${RESET}"
   echo -e "${GREEN}Running 'find' command instead...${RESET}"
   find $TARGET_FOLDER
else
  tree $TARGET_FOLDER
fi
