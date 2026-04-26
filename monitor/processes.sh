#!/bin/bash

#load common utilities
source ../utils/colors.sh
SCRIPT_DIR=$(dirname "$0")
source "$SCRIPT_DIR/../utils/colors.sh"


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

shell_jobs(){
	echo -e "${GREEN}the shell jobs are :${NC}"
	jobs
	echo ""
}


terminal_processes
system_processes
shell_jobs

