#!/bin/bash
set -e 
trap "echo erreur détectée" ERR  
echo -e  "\e[33m===== Surveillance du système =====\e[0m"
echo -e "\e[32mprocess status:\e[0m"
ps
echo -e "\e[32métat du disque:\e[0m"
 df -h
echo -e "\e[32mmémoire libre:\e[0m"
free -h
echo -e "\e[32mtemps de fonctionnement du système:\e[0m"
uptime
