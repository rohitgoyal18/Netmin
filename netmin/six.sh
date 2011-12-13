echo "This will create a user with the name you wish"
echo -n "Enter the name of the user:"
read name
useradd $name
passwd $name
