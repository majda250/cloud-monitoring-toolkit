#!/bin/bash

#colors variables

ORANGE="\033[0;33m"
GREEN="\033[0;32m"
RED="\033[0;31m"
BLUE="\033[0;34m"
NC="\033[0;0m"


echo -e  "${ORANGE}====== Network check =======${NC}"
echo -e "${BLUE} date : ${NC}" $(date "+%Y-%m-%d %T %Z")
echo -e "${GREEN}DNS Verification${NC}"
ping -c 1  google.com
echo -e "${GREEN}Internert Connectivity Verification${NC}"
ping -c 1 8.8.8.8
echo -e "${GREEN}Test HTTP/HTTPS${NC}"
curl -I https://www.google.com |head -1
echo -e "${GREEN}Traceroute${NC}"
traceroute google.com
echo -e "${GREEN}Network UP interfaces ${NC}"
ifconfig |grep 'UP' 
echo -e "${RED}Network DOWN interfaces ${NC}"
ifconfig  |grep 'DOWN' 
echo -e "${GREEN}Cables Verification ${NC}"
ip link show
echo -e "${GREEN}Principal Network interface ${NC}"
ip addr show |grep 'ens33'


