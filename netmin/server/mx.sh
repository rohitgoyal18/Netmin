echo "Enter the name of master zone"
read name 
echo "Enter the domain name"
read new 
echo "Enter the name of mail server"
read mail
echo "Enter the priority value"
read pr
echo "$new.        IN      MX      $pr $mail."|cat >> /var/named/chroot/var/named/$name.hosts
