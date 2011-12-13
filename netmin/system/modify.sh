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
echo '|  1. Change the home directory		        |'
tput cup 11 30
echo '|  2. Change the primary group                    |'
tput cup 12 30
echo '|  3. Change the secondary group                  |'
tput cup 13 30
echo '|  4. Change the user-id                          |'
tput cup 14 30
echo '|  5. Change the shell        			|'
tput cup 15 30
echo '|  Q. Quit 					|'
tput cup 16 30
echo '--------------------------------------------------'
tput cup 23 55
read  choice
case $choice in

1)      sh /netmin/rahul/system/chngdir.sh
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

2)      sh /netmin/rahul/system/chngpr.sh
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

3)      sh /netmin/rahul/system/chngsec.sh
        tput cup 30 30
        echo "Press enter to return to the menu "
        read;;

4)	sh /netmin/rahul/system/chnguid.sh
	tput cup 30 30
	echo "Press enter to return to the menu "
	read;;

5)	sh /netmin/rahul/system/chngsh.sh
	tput cup 30 30
	echo "Press enter to return to the menu "
	read;;

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

