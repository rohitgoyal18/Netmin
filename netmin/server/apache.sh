echo "Enter ip address for this web server"
read ip
echo "Enter the name of the server"
read name 
echo "Give the path of the document root"
read root 
mkdir $root
echo "This page is under construction"|cat >> $root/index.html
echo "
<VirtualHost $ip>
DocumentRoot "'"'$root'"'"
ServerName $name
<Directory "'"'$root'"'">
allow from all
Options +Indexes
</Directory>
</VirtualHost>" | cat >> /etc/httpd/conf/httpd.conf
service httpd restart
