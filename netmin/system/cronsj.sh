echo "Enter the user as which you want to execute the command"
read user 
grep $user /etc/passwd 
if [ $? -ne 0 ]
then 
echo "User does not exist"
exit 2 
fi 
ls /var/spool/cron|grep $user > /dev/null
if [ $? -ne 0 ]
then
touch /var/spool/cron/$user 
fi
echo "PLEASE DO NOT USE SPACES WHEN DEALING WITH THE COMMAS AND WHEREVER YOU NEED TO SPECIFY everyday OR every minute,etc. USE '*'"
echo "Enter the command you want to execute"
read comm
echo "Enter the minutes of the hour you want to execute command(in numbers, with comma as separator"
read mins
echo "Enter the hours of the day you want to execute command(in numbers, with comma as separator"
read hour 
echo "Enter the days (in numbers,using comma as separator)"
read date 
echo "Enter the months of the years (in numbers ,using comma as separator)"
read month 
echo "Enter the specific days of the week (in numbers, using comma as separator)"
read days 
echo "$mins $hour $date $month $days $comm"|cat >> /var/spool/cron/$user 
