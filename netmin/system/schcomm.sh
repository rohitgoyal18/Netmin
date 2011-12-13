echo "Enter the date that you want the commands to run in numerals"
echo "Year : "
read year
echo "Month : "
read month
echo "Day : "
read day 
echo "Enter the time you want the command to run (eg: 18:24,09:00):"
read tim 
echo "Enter the directory where you want the command to be executed: "
read dir
touch /file 
echo "cd $dir"|cat >/file
echo "Enter the command to be executed :"
read comm 
echo $comm |cat >> /file 
at -f /file $time $year-$month-$day

