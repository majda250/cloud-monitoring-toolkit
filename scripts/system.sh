#!/bin/bash

ORANGE="\033[0;33m"
GREEN="\033[0;32m"
RED="\033[0;31m"
BLUE="\033[0;34m"
NC="\033[0;0m"

set -e 
trap "echo erreur détectée" ERR  
echo -e  "${ORANGE}===== Surveillance du système =====${NC}"
echo ""

#show disk status
show_disque(){
	echo -e "${GREEN}check disk usage:${NC}"
	df -h
	
	
	echo ""
}


#show Ram status
show_ram(){
	echo -e "${GREEN}check memory usage:${NC}"
	free -h
	echo ""
}


#show uptime
show_uptime(){
	echo -e "${GREEN}check system uptime:${NC}"
	uptime
	echo ""
}


#show CPU status 
show_cpu(){
	echo -e "${GREEN}CPU usage:${NC}"
	echo "User time - applications running : $( top -b -n 1 |grep %Cpu |awk '{ print $2 }' )%"
	echo "System time - kernel operations : $( top -b -n 1 |grep %Cpu |awk '{ print $4 }' )%"
	echo "Nice time - low priority process : $( top -b -n 1 |grep %Cpu |awk '{ print $6 }' )%"
	id = $( top -b -n 1 |grep %Cpu |awk '{ print $8 }' )
	echo "Idle time - CPU doing nothing : ${id}%"
	if [id -gte 80]; then
		echo -e "${GREEN} ${NC}"
	
	echo ""
}

show_disque
show_ram
show_uptime
show_cpu
