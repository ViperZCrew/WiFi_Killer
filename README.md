# --- WiFi Killer ---
# 
# This is an simple coded script for killing wireless networks nearby your location.
# The script is based on the air* commands, and is easily build.
# You need an wireless adapter and then you can begin.
# Your interface is not the common wlan0mon, it's wlan0, we will spoof the MAC address and for this 
# we will use wlan0, after the attack restart the tool and disable the monitor mode, or disable it if you got any error.
# 
# Changelog v1.0-v1.1:
# - Added MAC address spoofer
# - Added MAC checker
# - Added Short-Tips
# - Fixed No Internet Connection after closing script
# - Fixed Background running monitor mode (Disable Monitor Mode option)
# - Fixed Beacon Error
#
# Installation:
# 
# git clone https://github.com/ViperZCrew/WiFi_Killer
# cd WiFi_Killer 
# chmod 777 *.sh
# bash wifi_killer.sh
# 
# All in one command:
# git clone https://github.com/ViperZCrew/WiFi_Killer && cd WiFi_Killer && chmod 777 *sh && bash wifi_killer.sh
#
# optional you can type:
# iwconfig
# or 
# ip a 
# 
# Deleting manually your wlan0mon etc monitor mode:
# 
# If you type: iwconfig and you have a network of any wlan0* like wlan0monmon 
# Then do this:
# iw wlan0monmon del
# airmon-ng stop wlan0mon or airmon-ng stop wlan0
# 
# Please use this tool only for trolling :D
# Spoof your mac, i will add this feature next update v1.1
# If you want a bigger tool, then star this tool.
# 
#
#
# Credits: ViperZCrew - MrBlackX
#################################################################################################################################

