#!/bin/bash

ORANGE="\033[0;33m"
GREEN="\033[0;32m"
RED="\033[0;31m"
BLUE="\033[0;34m"
NC="\033[0;0m"

set -e 
trap "echo erreur détectée" ERR  
echo -e  "${ORANGE}===== Surveillance du système =====${NC}"
echo -e "${GREEN}process status:${NC}"
ps
echo -e "${GREEN}état du disque:${NC}"
 df -h
echo -e "${GREEN}mémoire libre:${NC}"
free -h
echo -e "${GREEN}temps de fonctionnement du système:${NC}"
uptime
