echo "Enter the name of the new virtual interface [ Sample format eth0:1,2,etc ]Please follow the given format or your system will go for a toss ]"
read name 
ifconfig | grep $name >> /dev/null
if [ $? -eq 0 ]
then 
echo "Interface already exists"
exit 2 
fi
echo "Enter the ip address of this interface"
read ip
echo "Enter the subnet mask of this interface"
read sub
ifconfig $name $ip netmask $sub up
echo "Interface added"
