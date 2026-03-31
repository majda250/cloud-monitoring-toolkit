echo -e  "\e[33m====== Network check =======\e[0m"
echo -e "\e[34m date : \e[0m" $(date "+%Y-%m-%d %T %Z")
echo -e "\e[32mDNS Verification\e[0m"
ping -c 1  google.com
echo -e "\e[32mInternert Connectivity Verification\e[0m"
ping -c 1 8.8.8.8
echo -e "\e[32mTest HTTP/HTTPS\e[0m"
curl -I https://www.google.com |head -1
echo -e "\e[32mTraceroute\e[0m"
traceroute google.com
echo -e "\e[32mNetwork UP interfaces \e[0m"
ifconfig |grep 'UP' 
echo -e "\e[31mNetwork DOWN interfaces \e[0m"
ifconfig  |grep 'DOWN' 
echo -e "\e[32mCables Verification \e[0m"
ip link show
echo -e "\e[32mPrincipal Network interface \e[0m"
ip addr show |grep 'ens33'

