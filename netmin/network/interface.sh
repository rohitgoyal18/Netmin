ear
while [ 1 ]
do
clear
echo
echo
echo
tput cup 9 30
echo '--------------------------------------------------'
tput cup 10 30
echo '|  1. Add new virtual interface                   |'
tput cup 11 30
echo '|  2. De-activate the interface                   |'
tput cup 12 30
echo '|  3. View interfaces                             |'
tput cup 13 30
echo '|  Q. Quit                                        |'
tput cup 14 30
echo '|  P. Previous Menu                               |'
tput cup 15 30
echo '|  Enter your choice :                            |'
tput cup 16 30
echo '--------------------------------------------------'
tput cup 23 55
read  choice
case $choice in

1)      sh /netmin/rahul/network/add.sh
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

2)      sh /netmin/rahul/network/down.sh
        tput cup 30 30
        echo "Press enter to return to the menu. "
        read;;

3)      sh /netmin/rahul/network/show.sh
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


