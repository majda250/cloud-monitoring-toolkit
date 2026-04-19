#!/bin/bash

#load common utilities
source ../utils/colors.sh

#save in a log directory

Log_File="../logs/performance_logs/performance_log_$(date  +%Y-%m-%d).txt"
exec > >(tee "$Log_File") 2>&1
