#!/bin/bash

#load common utilities
source ../utils/colors.sh

#save in a log directory

Log_file="../logs/security_logs/security_log_$(date  +%Y-%m-%d).txt"

open_ports(){
	echo -e "${RED}Open ports are:${NC}"
	ss -tulnp
	echo ""
}




open_ports

