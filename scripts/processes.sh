#!/bin/bash

#load common utilities
source ../utils/colors.sh

echo -e "${ORANGE}===== Processes monitoring ====${NC}"
echo ""

terminal_processes(){
	echo -e  "${GREEN} Running programs on this terminal are :${NC}"
	ps
	echo ""
}
system_processes(){
	echo -e "${GREEN} Running programs on the system are : ${NC}"
	ps aux 
	echo ""
}


terminal_processes
system_processes
