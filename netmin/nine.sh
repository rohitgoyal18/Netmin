clear
echo "This is add subtract divide or multiply two numbers as per your requirement."
echo -n "Enter the first number:"
read i
echo -n "Enter the second number:"
read j
echo -n "Enter the operator:"
read op
echo -n "The result is:"
case $op  in
+)
	res=`expr $i + $j`
                ;;
-)	
	res=`expr $i - $j`
		;;
/)
	res=`expr $i / $j`
	;;
\*)	res=`expr $i \* $j`
	;;

esac
echo "$res"
