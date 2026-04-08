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
}

show_disk_space
