echo " This will find the greater of two numbers."
echo -n "Enter the first number:"
read i
echo -n "Enter the second number:"
read j
if [ $i -gt $j ]
then 
	echo "The greater number is $i"
else
	echo "The greater number is $j"
fi
	
