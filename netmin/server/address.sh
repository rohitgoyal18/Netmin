echo "Enter the domain name"
read name 
echo "Enter absolute name (can be master or child): "
read new
echo "Enter address : "
read ad
echo "$new.             IN      A       $ad" |cat >> /var/named/chroot/var/named/$name.hosts

