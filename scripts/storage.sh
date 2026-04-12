#!/bin/bash

#load shared utilities
source ../utils/colors.sh


#log saving
Log_File="../logs/storage_logs/log_storage_$(date +%Y-%m-%d).txt"
exec > >(tee "$Log_File") 2>&1

#storage_monitoring 
echo -e "${ORANGE}storage monitoring ${NC}"
echo ""



show_disk_space(){
	echo ""
	echo -e "${GREEN}the amount of disk space used and available is:${NC} "
	df -h
	echo "" 
}



show_partition_space(){
	echo -e "${GREEN}Display partition usage ${NC}"
	df -h | awk 'NR>1 {printf "Partition: %s |Total: %s |Utilisée: %s|Libre: %s \n", $1,$2,$3,$4}'
	echo ""
}



get_disk_usage_alerts(){
    df -B1 | awk -v RED="$RED" -v GREEN="$GREEN" -v NC="$NC" '
    NR>1 {
        usage = ($3/$2)*100

        if (usage > 80) {
            color = RED
            status = "ALERTE"
        } else {
            color = GREEN
            status = "OK"
        }

        printf "%s%s%s : %.2f%% [%s]\n", color, $1, NC, usage, status
    }'
}

show_inodes(){
	echo -e "${GREEN}inodes details (inode used, free and use percentage) are:${NC}"
	df -i
	echo ""
}



show_disk_space
show_inodes
show_partition_space
get_disk_usage_alerts
