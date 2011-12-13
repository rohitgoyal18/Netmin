echo "Service        Disabled?"
touch dis names
ls -1 /etc/xinetd.d|cat > names
count=`wc -l names|cut -d ' ' -f 1`
for (( n=1; n<=$count; n++ ))
do
	name=`sed -n "$n p" names`
	grep 'disable' /etc/xinetd.d/$name|cut -d '=' -f 2|cat >> dis
done
paste -d "\t\t\t\t" names dis|more
rm dis
rm names

