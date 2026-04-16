#!/bin/bash

#load common utilities
source ../utils/colors.sh

#save in a log directory

Log_File="../logs/security_logs/security_log_$(date  +%Y-%m-%d).txt"
exec > >(tee "$Log_File") 2>&1



open_ports(){
	echo -e "${RED}Open ports are:${NC}"
	ss -tulnp
	echo ""
}

suspect_ports(){
	echo -e "${GREEN}Thos ports might be suspescious${NC}"
	known_ports="22|80|443|3306"
	ss -tulnp |grep -vE "(known_ports)" || echo "${GREEN}no suspoect ports${NC}"
	echo ""
}



ssh_connexion(){
	echo -e "${GREEN}succesful ssh Logins are:${NC}"
	grep "Accepted" /var/log/auth.log | awk '{print $1,$2,$3, "| User:",$9, "|IP:",$11 }'
	echo ""
	echo -e "${RED}failed ssh Logins connexion are :${NC}"
	grep "Failed passsword" /var/log/auth.log | awk '{print $1,$2,$3, "| User:",$9, "|IP:",$11 }'
	echo ""
}



Root_attempts(){
	echo -e "${RED}root attemps connexion are : ${NC}"
	grep "password attempts" /var/log/auth.log
	echo ""
}

actual_connexion(){
	echo -e "${GREEN}Currently logged in users: ${NC}"
	who  
	echo ""

	echo -e "${GREEN}the number of session is:${NC}"
	who -a |wc -l
	echo ""

	echo -e "${GREEN}the numberof users is: ${NC}"
	who | awk '{print $1}' | sort -u | wc -l
	echo ""

	echo  -e "${GREEN}System boot time: ${NC}"
	who -b
	echo "" 

	echo -e  "${GREEN}System run state: ${NC}"
	who -r
	echo ""

}

open_ports
suspect_ports
ssh_connexion
Root_attempts
actual_connexion
