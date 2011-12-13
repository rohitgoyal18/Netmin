echo "Enter the name of the interface that you would like to deactivate. Format - eth0, eth0:1,etc. Please follow the format to avoid undesirable results"
read name 
ifconfig|grep $name >> /dev/null
if [ $? -ne 0 ]
then 
echo " This interface is not active"
exit 2 
fi 
ifconfig $name down
echo " $name de-activated"
