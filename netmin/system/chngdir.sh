echo "Enter the name of the user"
read name
grep $name /etc/passwd 
if [ $? -ne 0 ]
then 
echo "User does not exist"
exit 2 
fi
echo "Enter the new home directory path (eg: /home/hello or /jo)"
read home
mkdir $home
chown $name $home 
chgrp $name $home
chmod 700 $home
old=`grep $name /etc/passwd | cut -d : -f 6`
echo $old
sed -n "s#$old#$home#" /etc/passwd
cp -r /etc/skel $home

