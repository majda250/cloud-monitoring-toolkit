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
	echo -e "${RED}Thos ports might be suspescious${NC}"
	known_ports="22|80|443|3306"
	ss -tulnp |grep -vE "($known_ports)" || echo "${GREEN}no suspoect ports${NC}"
	echo ""
}



ssh_connexion(){
	echo -e "${GREEN}succesful ssh Logins are:${NC}"
	grep "Accepted" /var/log/auth.log | awk '{print $1,$2,$3, "| User:",$9, "|IP:",$11 }'
	echo ""
	echo -e "${RED}failed ssh Logins connexion are :${NC}"
	grep "Failed password" /var/log/auth.log | awk '{print $1,$2,$3, "| User:",$9, "|IP:",$11 }'
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



check_last_boot(){
	echo -e "${GREEN}Checking system boot information:${NC}"
	last 
	echo ""

}


sudo_activity(){
	echo -e "${GREEN}Checking sudo/root activities:${NC}"
	grep "sudo" /var/log/auth.log | tail -n 10
	echo ""
}



open_ports
suspect_ports
ssh_connexion
Root_attempts
actual_connexion
check_last_boot
sudo_activity


users=$(who | awk '{print $1}' | sort -u | wc -l)
cat <<EOF >  /tmp/security_metrics.prom
connected_users $users
EOF
