#!/bin/bash

# Description: script for ubuntu-server setup
# Author: Amancio C.
# Date: 25-06-2024

## INSTALL GUIDE

    # run script with sudo privileges + username

    # EXAMPLE: sudo ./ubuntu-server.sh NewUser1
    #          ----|------------------|--------|
    #              |   script-name    |   $1   |


## SCRIPT VARIABLES


    #HIGH INTENSITY (NORMAL)
    RED="\e[0;91m"
    GREEN="\e[0;92m"
    YELLOW="\e[0;93m"
    BLUE="\e[0;94m"
    PURPLE="\e[0;95m"
    CYAN="\e[0;96m"
    WHITE="\e[0;97m"

    #HIGH INTENSITY (BOLD)
    BRED="\e[1;91m"
    BGREEN="\e[1;92m"
    BYELLOW="\e[1;93m"
    BBLUE="\e[1;94m"
    BPURPLE="\e[1;95m"
    BCYAN="\e[1;96m"
    BWHITE="\e[1;97m"
    
    #HIGH INTENSITY (UNDERLINE)
    URED="\e[4;91m"
    UGREEN="\e[4;92m"
    UYELLOW="\e[4;93m"
    UBLUE="\e[4;94m"
    UPURPLE="\e[4;95m"
    UCYAN="\e[4;96m"
    UWHITE="\e[4;97m"

    #RESET/END
    ENDCOLOR="\e[0m"

    #SHOW DATE
    Now=$(date)

    #CURRENT USERNAME
    MyUser=$1
    

## POST INSTALL WELCOME MESSAGE

echo ""
echo -e "${BYELLOW}                                                 ,_,${ENDCOLOR} 
        ${BYELLOW}https://github.com/projects-by-ac${ENDCOLOR}       ${YELLOW}(O,O)  
________________________________________________(   )__
                                                 " "
                                                    
        ╔═╗╦═╗╔═╗ ╦╔═╗╔═╗╔╦╗╔═╗  ┌┐ ┬ ┬  ╔═╗╔═╗  
        ╠═╝╠╦╝║ ║ ║║╣ ║   ║ ╚═╗  ├┴┐└┬┘  ╠═╣║      
        ╩  ╩╚═╚═╝╚╝╚═╝╚═╝ ╩ ╚═╝  └─┘ ┴   ╩ ╩╚═╝     
  (@>                                                  
__{||__________________________________________________
   ""||${ENDCOLOR}
${YELLOW}    |   Author:${ENDCOLOR} Amancio C.
${YELLOW}    |   Description:${ENDCOLOR} Script {Ubuntu-Server Setup}
"
echo ""
echo -e "initializing script on ${GREEN}$Now${ENDCOLOR}"
echo ""
sleep 1
echo -e "${BYELLOW}.......................................................${ENDCOLOR}"
echo ""
echo -e "${BYELLOW}WELCOME! INSTALLING SCRIPT FOR THE FOLLOWING USER:${ENDCOLOR}"
echo ""
echo -e "${BWHITE}$1${ENDCOLOR}"
echo ""
read -p "Do you want to proceed? (Y/n)" -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
echo ""
echo -e "${BYELLOW}script will start running in${ENDCOLOR}"
sleep 1
echo -e "${BYELLOW}3...${ENDCOLOR}"
sleep 1
echo -e "${BYELLOW}2...${ENDCOLOR}"
sleep 1
echo -e "${BYELLOW}1...${ENDCOLOR}"
sleep 1
echo ""
echo -e "${BYELLOW}*/running script${ENDCOLOR}"
echo ""
sleep 1
echo -e "${BYELLOW}.......................................................${ENDCOLOR}"

## UBUNTU AUTO-SETUP SCRIPT

#GRANT SUDO PRIVILEGES
echo ""
echo -e "${BYELLOW}***GRANT USER SUDO PRIVILEGES***${ENDCOLOR}"
echo ""
usermod -aG sudo $MyUser
echo "$MyUser is now an administrator"
echo ""

#SET-DATE-TIME-TIMEZONE=NL
echo -e "${BYELLOW}***SETTING CORRECT TIMEZONE***${ENDCOLOR}"
echo ""
timedatectl set-timezone Europe/Amsterdam
timedatectl set-ntp on
echo "Europe/Amsterdam"
date
echo ""

#UPDATE-UPGRADE-AUTOREMOVE
echo -e "${BYELLOW}***UPDATING PACKAGES***${ENDCOLOR}"
echo ""
apt update -qq -y & pid=$!
i=1
sp="\|/-"
while ps -p $pid > /dev/null
do
    printf "\b%c" "${sp:i++%4:1}"
    sleep 0.1
done
printf "\nDone!\n"
echo ""

echo -e "${BYELLOW}***UPGRADING PACKAGES***${ENDCOLOR}"
echo ""
apt upgrade -q -y & pid=$!
i=1
sp="\|/-"
while ps -p $pid > /dev/null
do
    printf "\b%c" "${sp:i++%4:1}"
    sleep 0.1
done
printf "\nDone!\n"
echo ""

echo -e "${BYELLOW}***REMOVING LEFTOVER PACKAGES***${ENDCOLOR}"
echo ""
apt autoremove -q -y & pid=$!
i=1
sp="\|/-"
while ps -p $pid > /dev/null
do
    printf "\b%c" "${sp:i++%4:1}"
    sleep 0.1
done
printf "\nDone!\n"
echo ""

#INSTALL CLI-TOOLS
echo -e "${BYELLOW}***INSTALLING CLI-TOOLS***${ENDCOLOR}"
echo ""
apt install curl wget apt-transport-https htop duf fzf nnn -q -y  & pid=$!
i=1
sp="\|/-"
while ps -p $pid > /dev/null
do
    printf "\b%c" "${sp:i++%4:1}"
    sleep 0.1
done
printf "\nDone!\n"
echo ""

#SETUP & ACTIVATE UFW FIREWALL & ALLOW SSH
echo -e "${BYELLOW}***ACTIVATING UFW FIREWALL***${ENDCOLOR}"
echo ""
echo "y" | sudo ufw enable
echo ""
echo -e "${BYELLOW}***ALLOWING FIREWALL SSH-ACCESS***${ENDCOLOR}"
echo ""
ufw allow ssh       #OPEN-SSH
ufw reload
systemctl --no-pager status ufw.service
echo ""

#END
echo -e "${BYELLOW}***SYSTEM INFORMATION***${ENDCOLOR}"
echo ""
uname -a
echo ""
duf
echo ""
echo -e "${BYELLOW}***DONE INSTALLING UBUNTU SERVER SCRIPT***${ENDCOLOR}"
echo ""