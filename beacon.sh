#!/bin/bash
RED="\e[31m"
. wifi_killer
figlet Starting Beaconer...
sleep 2
echo -e $RED "
[!] DO NOT PRESS CTRL+C UNTIL THE MAIN TERMINAL IS RUNNING!
IF THE MAIN WINDOWS HAS BEEN COMPLETED THEN CLOSE THIS TERMINAL
"
airodump-ng -c $channel --bssid $target $mode2
sleep 1
exit
