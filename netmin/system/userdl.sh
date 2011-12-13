echo "enter the name of the user to delete"
read name 
touch /q
touch /p
grep $name /etc/passwd >/dev/null
if [ $? -ne 0 ]
then 
echo "User does not exist"
exit 2 
fi
sed '/'$name'/d' /etc/passwd > /q
m=`grep $name /etc/passwd | cut -d : -f 3`
cut -d : -f 4 /q | grep $m
if [ $? -eq 0 ]
then 
echo "The home directory and group are still intact as it the a primary group"
else 
rm -r /home/$name
sed '/'$name'/d' /etc/group > /p
mv /p /etc/group
fi
mv /q /etc/passwd 
cat /etc/passwd 
cat /etc/group

