####### Script Begins #######
#!/bin/bash

DEV=wlan0

iw wlan0mon del &> /dev/null
sleep .1
iw wlan0monmon del &> /dev/null
sleep .1
ifconfig $DEV down
sleep .1

iw reg set GY

iwconfig $DEV mode manage
sleep .1
macchanger -a $DEV

sleep 2 # Need time to complete op

iwconfig $DEV mode manage
sleep .1
ifconfig $DEV up
sleep .1
iw $DEV interface add wlan0mon type monitor
sleep .1
ifconfig wlan0mon down
sleep .1
iwconfig wlan0mon mode manage
sleep .1
ifconfig wlan0mon up &> /dev/null
sleep .1
airmon-ng start wlan0mon &> /dev/null
sleep .1
ifconfig $DEV down
sleep .1
iwconfig $DEV mode monitor
sleep .1
ifconfig $DEV up
sleep .1
ifconfig wlan0mon down
sleep .1
macchanger -a wlan0mon

sleep 2 # Need time to complete op

iwconfig wlan0mon mode monitor
sleep .1
ifconfig wlan0mon up
sleep .1
# Test with airodump-ng
airodump-ng wlan0mon
