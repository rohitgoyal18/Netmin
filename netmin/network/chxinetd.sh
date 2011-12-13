sh /netmin/rahul/network/dispxinetd.sh|more
echo "Enter the service name(exactly matching the names above) to be enabled/disabled"
read name
clear
touch /tempo 
a=`cat /etc/xinetd.d/$name|grep 'disable'|cut -d '=' -f 2`
if [ $a = 'no' ]
then 
sed '/disable/s/no/yes/' /etc/xinetd.d/$name|sed -n '1,$w /tempo' 
else 
sed '/disable/s/yes/no/' /etc/xinetd.d/$name|sed -n '1,$w /tempo'
fi
mv /tempo /etc/xinetd.d/$name
clear
sh /netmin/rahul/network/dispxinetd.sh|more
