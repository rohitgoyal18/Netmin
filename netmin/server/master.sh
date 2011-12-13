echo "Enter the name of the master zone"
read name 
echo "Enter email address"
read id 
echo "Enter name server"
read ns 
echo    "zone "'"'$name'"'" {
        type master;
        file "'"'/var/named/$name.hosts'"'";
        };
       " | cat >> /etc/named.conf


echo "$name.                IN      SOA     $ns. jdh (
                                1243528301
                                10800
                                3600
                                604800
                                38400 )
$name.                 IN      NS      $ns."| cat >> /var/named/chroot/var/named/$name.hosts
echo "Master Zone created"



