echo "Enter the user whose cron jobs you want to see"
read user 
ls /var/spool/cron |grep $user > /dev/null
if [ $? -ne 0 ]
then 
echo "User does not exist"
exit 2 
fi 
cut -d ' ' -f 6,7,8,9,10 /var/spool/cron/$user 
echo "Enter the line number of the job to be deleted"
read num 
touch /temp
sed "$n d" /var/spool/cron/$user > /temp
mv /temp /var/spool/cron/$user 

