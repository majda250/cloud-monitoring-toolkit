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
    echo -e "${GREEN}disque usage alerts :${NC}"	
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
    echo ""
}





show_file_system_type(){
	echo -e "${GREEN}The file system type of each partition is: ${NC}"
	df -T | awk  -v orange="$ORANGE" -v NC="$NC" '
	NR>1 {printf "%sPartition:%s%s | %sfile system type:%s %s\n", orange , NC ,$1 , orange,NC,$2}'
	echo ""
}


show_inode_partition(){
    echo -e "${GREEN}Inodes for partition are:${NC}"

    df -i | awk -v ORANGE="$ORANGE" -v NC="$NC" '
    NR>1 {
        printf "%sPartition:%s %s | %sTotal inodes:%s %s | %sUsed inodes:%s %s | %sFree inodes:%s %s\n",
            ORANGE, NC, $1,
            ORANGE, NC, $2,
            ORANGE, NC, $3,
            ORANGE, NC, $4
    }'
    echo ""
}

check_inode_threshold(){
	echo -e "${GREEN}The inods alert check${NC}"
	df -i |awk -v RED="$RED" -v GREEN="${GREEN}" -v  NC="$NC" 'NR>1 {usage = $3/$2*100
	if (usage > 80) {
		color=RED
		status="ALERT"
	} else {
		color=GREEN
		status="OK"
	}
	printf("the partition  usage is : %s its usage is :  %s %s %s [%s]\n", $1,color,usage,NC,status)
	}'
	echo ""
}


disk_usage_rate(){
	echo -e "${GREEN} the usage rate of the disk is :${NC}"
	iostat -x 1 1 | awk -v RED="$RED" -v GREEN="$GREEN" -v ORANGE="$ORANGE" -v NC="$NC" '
	/^sd/{
		usage = $NF

		if ( usage == 0 ){
			status = "inactive disk"
			color = ORANGE
		} else if ( usage > 0 && usage < 50 ){
			status = "normal disk usage"
			color = GREEN
		}else {
			status = "warning the disk started to be saturated"
			color = RED
		}
		printf "the partition : %s usage : %s %s[%s]%s \n",$1, usage,color,status,NC
}'
}

check_disk_latency(){
	echo -e "${GREEN}the disk latency is : ${NC}"
	iostat -x 1 1 | awk '
	/^Device/ {for (i=1;i<=$NF;i++) if ($i=="await"} col=i}
	$1 ~ /^(sd|nvme)/ {print $1,$(col)'}
} 




show_disk_space
show_partition_space
get_disk_usage_alerts
show_file_system_type
show_inode_partition
check_inode_threshold
disk_usage_rate
check_disk_latency
