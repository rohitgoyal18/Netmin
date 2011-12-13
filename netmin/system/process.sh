clear
while [ 1 ]
do
clear
echo
echo
echo
tput cup 9 30
echo '--------------------------------------------------'
tput cup 10 30
echo '|  1. View all processes			        |'
tput cup 11 30
echo '|  2. View by user                                |'
tput cup 12 30
echo '|  3. View the CPU usage                          |'
tput cup 13 30
echo '|  4. View the memory usage                       |'
tput cup 14 30
echo '|  5. Run a process                               |'
tput cup 15 30
echo '|  Q. Quit                                        |'
tput cup 16 30
echo '|  P. Previous Menu                               |'
tput cup 17 30
echo '|  Enter your choice :                            |'
tput cup 18 30
echo '--------------------------------------------------'
tput cup 23 55
read  choice
case $choice in

1)      ps -ef | cut -c 1-10,11-18,25-30,49- |more
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

2)      echo "Enter the user to see their processes"
	read name 
	grep $name /etc/passwd > /dev/null 
	if [ $? -ne 0 ]
	then 
	echo "User does not exist"
	else 
	ps -u $name |more
	fi
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

3)	ps aux | cut -c 1-16,26-32,64- |more
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

4)      ps aux | cut -c 1-20,64-|more
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

5)      echo "Input command to run "
	y='y'
	n='n'
	read com
	echo "Run in background? (y/n)"
	read ans 
	echo "Running only as root"
	if [ $ans = $y ]
	then 
	a='&'
	comm="$com $a"
	$comm
	elif [ $ans = $n ]  
	then
	$com
	else 
	echo "Not a valid option"
	fi
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

P)

        clear
                exit;;
p)

        clear
                exit;;
Q)

        clear
                exit [2];;

q)
        clear
                exit [2];;

*)      tput cup 30 30
        echo "IMPROPER CHOICE"
        tput cup 31 30
        echo "Press Enter to continue"
        read id
esac
done            

