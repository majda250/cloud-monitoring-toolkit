#!/bin/bash

#load common utilities
SCRIPT_DIR=$(dirname "$0")
source "$SCRIPT_DIR/../utils/colors.sh"

#save in a log directory

Log_File="$SCRIPT_DIR/../logs/performance_logs/performance_log_$(date  +%Y-%m-%d).txt"
exec > >(tee "$Log_File") 2>&1


echo -e "${ORANGE}=== Beginning of VM test ===${NC}"
echo ""

system_info(){

	uname -a 
	echo ""

	echo -e "${GREEN}OS version : ${NC}"
	cat /etc/os-release
	echo ""

	echo -e "${GREEN}RAM disponible : ${NC}"
	free -h
	echo ""

	echo -e "${GREEN}Disk free : ${NC}"
	df -h
	echo ""

	echo -e  "${GREEN}Cpu detailled information (list Cpu) : ${NC}"
	lscpu
	echo ""

}

Test_cpu(){
	echo -e 

}


system_info


