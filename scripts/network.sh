#!/bin/bash

#colors variables

ORANGE="\033[0;33m"
GREEN="\033[0;32m"
RED="\033[0;31m"
BLUE="\033[0;34m"
NC="\033[0;0m"

#log saving
Log_File="../logs/log_$(date +%Y-%m-%d).txt"
exec > >(tee "$Log_File") 2>&1


#network check
echo -e  "${ORANGE}====== Network check =======${NC}"
echo -e "${BLUE} date : ${NC}" $(date "+%Y-%m-%d %T %Z")
echo -e "${BLUE}Hostname: $(hostname) ${NC}"
echo ""

echo -e "${BLUE}DNS Verification${NC}"
if ping -c 1  google.com &>/dev/null;then
	echo -e "${GREEN}DNS functional (google.com resolved)${NC}"
else 
	echo -e "${RED}DNS is not funcctional"
fi
echo ""

echo -e "${BLUE}Internet Connectivity Verification and latency${NC}"
if ping -c 1 8.8.8.8 &>/dev/null;then
	Latency=$(ping -c 1 8.8.8.8 |tail -1|awk '{print $4}'|cut -d "/" -f 2 ) 
	echo -e "${GREEN}google is reachable & latency=${Latency} ms${NC}"
else
	echo -e  "${RED}google is not reachable${NC}"
fi
echo ""

echo -e "${BLUE}Test HTTP/HTTPS${NC}"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I https://www.google.com)
if [ "$HTTP_CODE"="200" ];then
	echo -e "${GREEN}HTTPS OK (Status:$HTTP_CODE) ${NC}"
else
	echo -e "${RED}HTTP/HTTPS Failure${NC}"
fi 
echo ""

echo -e "${BLUE}IP Adress${NC}"
IP_Adrr=$(curl -s ifconfig.me 2>/dev/null )
if  [ -n IP_Addr ];then
	echo -e "${GREEN}the IP Adress is : ${IP_Adrr} ${NC}"
else
	echo -e "${RED}Unable to retrieve pblic IP${NC}"
fi
echo ""


echo -e "${BLUE}Traceroute${NC}"
if command -v traceroute &>/dev/null; then
	traceroute  -n -m 5 8.8.8.8 2>/dev/null |head -3
else
	echo -e  "${RED} traceroute not installed ( sudo apt install traceroute)${NC}" 
fi
echo ""


echo -e "${BLUE}Network UP interfaces ${NC}"
if ifconfig |grep 'UP'  ;then
	echo -e "${GREEN}at least one interface is up${NC}"
else
	echo -e "${GREEN}NO interface is up${NC}"
fi
echo ""


echo -e "${BLUE}Network DOWN interfaces ${NC}"
if ifconfig  |grep 'DOWN';then
	echo -e "${RED} at least one interface is down ${NC}"
else
	echo -e "${GREEN}No interface is down${NC}" 
fi
echo ""



