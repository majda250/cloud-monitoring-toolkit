#!/bin/bash

#load shared utilities
source ../utils/colors.sh

#log_saving
Log_File="../logs/system_logs/log_system_$(date +%Y-%m-%d).txt"
exec > >(tee "$Log_File") 2>&1



set -e 
trap "echo erreur détectée" ERR  
echo -e  "${ORANGE}===== System monitoring =====${NC}"
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
show_nbrcpu(){
	echo -e "${GREEN}the number of cpu is :${NC}"
	grep -c ^processor /proc/cpuinfo
	echo ""
}




show_cpu(){
	echo -e "${GREEN}CPU usage:${NC}"
	echo "User time - applications running : $( top -b -n 1 |grep %Cpu |awk '{ print $2 }' )%"
	echo "System time - kernel operations : $( top -b -n 1 |grep %Cpu |awk '{ print $4 }' )%"
	echo "Nice time - low priority process : $( top -b -n 1 |grep %Cpu |awk '{ print $6 }' )%"
	
	echo ""

	idle=$( top -b -n 1 |grep %Cpu |awk '{ print $8 }' )
	echo "Idle time - CPU doing nothing : ${idle}%"
	if [ "$idle" -lt 20 ]; then
		echo -e "${RED}CPU overload: ${idle}% ${NC}"
	elif [ "$idle" -lt 50 ];then
		echo -e "${ORANGE}high CPU USAGE : ${idle}%  ${NC}"
	else 
		echo -e "${GREEN}CPU idle: ${idle}% (healthy)${NC}"
	fi	
	echo ""
}




show_os(){
	echo -e  "${GREEN}the os version is :  ${NC} "
	cat /etc/os-release	
	echo ""
}

show_kernel(){
	echo -e  "${GREEN}the system type is : ${NC}"
	if [ "$(uname)" = "Linux" ];then
		echo "Welcome to Linux"
	fi 
	echo -e "${GREEN}the kernel version is : ${NC}"
	uname -r
	echo ""
}



show_disque
show_ram
show_uptime
show_cpu
show_nbrcpu 
show_os
show_kernel
