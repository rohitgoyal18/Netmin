#!/bin/bash
choice()
{
echo -e "View another table [Y/N]: \c"
read CHOICE
case $CHOICE in
   Y|y) . table.sh ;;
   N|n) exit ;;
     *) echo
        echo Invalid entry!
        choice ;;
esac
}
echo -e "Enter a number to view it's table : \c"
read NUMBER
M=1
while [ $M -le 10 ]
do
   echo "$NUMBER X $M  = `expr $NUMBER \* $M`"
   M="`expr $M + 1`"
done
choice
