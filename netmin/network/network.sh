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
echo '|  1. Network Interfaces(not active at boot)      |'
tput cup 11 30
echo '|  2. Routing and Gateways                        |'
tput cup 12 30
echo '|  3. Hostname and DNS                            |'
tput cup 13 30
echo '|  4. Host Address                                |'
tput cup 14 30
echo '|  5. Extended Internet Services                  |'
tput cup 15 30
echo '|  6. Apply Changes                               |'
tput cup 16 30
echo '|  Q. Quit                                        |'
tput cup 17 30
echo '|  P. Previous Menu                               |'
tput cup 18 30
echo '|  Enter your choice :                            |'
tput cup 19 30
echo '--------------------------------------------------'
tput cup 23 55
read  choice
case $choice in

1)      sh /netmin/rahul/network/interface.sh
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

2)      sh /netmin/rahul/network/routing.sh 
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

3)      sh /netmin/rahul/network/hostdns.sh
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

4)      sh /netmin/rahul/network/hostaddr.sh
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

5)	sh /netmin/rahul/network/xinetd.sh
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

6)	#service network restart
	#echo "Changes applied"
	tput cup 30 30
	echo "Press enter to return to the menu. "
	read;;

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

