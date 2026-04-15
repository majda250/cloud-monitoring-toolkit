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

suspect_ports(){
	echo -e "${GREEN}Verification of suspect ports${NC}"
	known_ports="22|80|443|3306"
	ss -tulnp |grep -vE "(known_ports)" || echo "${GREEN}no suspoect ports${NC}"
	echo ""
}


open_ports
suspect_ports
