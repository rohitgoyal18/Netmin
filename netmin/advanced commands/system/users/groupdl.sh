echo "Enter the name of the group to delete"
read gp
touch /p
grep $gp /etc/group >/dev/null
if [ $? -ne 0 ]
then 
echo "Group does not exist"
exit 2 
fi
n=`grep $gp /etc/group | cut -d : -f 3` 
cut -d : -f 4 /etc/passwd | grep $n
if [ $? -eq 0 ]
then 
echo "Cannot delete primary group"
exit 2 
fi
sed '/'$gp'/d' /etc/group > /p
rm /etc/group
mv /p /etc/group
cat /etc/group

