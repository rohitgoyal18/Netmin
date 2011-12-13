#!/bin/sh
# Netmin Project
# Variables Declarations
mkdir tempfiles;
tf1=./tempfiles/temp1;tf2=./tempfiles/temp2;choice1=./tempfiles/choice1;choice2=./tempfiles/choice2;
#############################################################
# Welcome Screen
#############################################################
welcome()
{
	dialog  --infobox "Welcome to Netmin Project....\n\n\n\n Only Change passwords under System is Scripted \n\nPlease wait . . . " 25 50;sleep 4;
}
#############################################################
# Authentication to be nettech user
#############################################################
netminauth()
{
	dialog  --title "Netmin Authentication" --clear --inputbox "This is to authenticate a valid Nettech User\
	\n\n\nUse the username and password used in Nettech \n\n \n\n\n .\
	Enter the username in nettech : " 25 50  2>$tf1;

temp=`cat $tf1`;

	if test $temp == mango
		then
			dialog --title "Netmin Authentication" --clear --insecure --passwordbox "\n\n\n\n\nEnter password for the user : mango \n\n\
			" \
			 25 50 2>$tf2;
			temp1=`cat $tf2`;
                        if test $temp1 == nettech
				then
					return 0;
			else 
					return 1;		
			fi
	else
			return 1;
	fi
}
##############################################################
# Functions
##############################################################
changepasswords()
{ 	
	cut -d : -f 1 /etc/shadow >./tempfiles/userlist
	tempscript=./tempfiles/tempscript;
	rm -rf $tempscript;
	echo "tf1=./tempfiles/temp1;tf2=./tempfiles/temp2;" >>$tempscript;
	echo    dialog --title \"Change Passwords\" --radiolist \"Select a user to change his or her password\" 35 50 28 '\' >>$tempscript;
	cat ./tempfiles/userlist | while read line
	do
		echo \"$line\"  \"\" off '\' >>$tempscript;
	done;
	echo "2>"'$'"tf1" >>$tempscript;
	echo "temp3="'$''?' >>$tempscript
        echo "case " '$'"temp3 in" >>$tempscript
        echo " 0 "')' "temp1="'`'"cat "'$'"tf1"'`' >>$tempscript;
        		echo dialog --title \"Changing Unix user password\" --clear --insecure --no-cancel --passwordbox \"Changing password for '$'temp1 '\' >>$tempscript;
        		echo '\'n'\'n'\'nNew password \" 25 50 "2>"'$'"tf2;" >>$tempscript;

			echo "temp2="'`'"cat "'$'"tf2"'`'';'     "echo" '$'temp2 '|' "passwd" --stdin '$'temp1';'>>$tempscript;
			echo dialog  --infobox \"'\'n'\'n'\'nall authentication tokens updated successfully.\" 10 50';'sleep 2';' ';'';' >>$tempscript
        echo " 1 "')'    "exit"';'';' >>$tempscript
        echo " 255 "')'  "exit"';'';' >>$tempscript
        echo "esac" >>$tempscript
	chmod 777 $tempscript;
	./tempfiles/tempscript;
}
##############################################################
# Sub Menu for Netmin
##############################################################
menunetmin()
{
dialog  --item-help \
                --default-item "Netmin Configurations" \
                --clear \
                --no-cancel\
                --title "Netmin" \
                --menu " Select an Option\n\n\n ..." 25 50 11\
                "Netmin Configurations"        	""      "Change configurations of Netmin"\
                "Netmin Logfiles"        	""      "Netmin Logfiles"\
                "About System"       		""      "Brief details about system"\
                "Netmin Users"    		""      "Change users to allow to login into Netmin" \
                "Back"          		""      "Return to Main Menu " \
                2>$choice2;
choice=`cat $choice2`

case $choice in
  "Netmin Configurations"      	)
                        		echo "Netmin ";;
  "Netmin Logfiles"      	)
                        		echo "System chosen";;
  "About System"     		)
                        		echo "Servers chosen.";;
  "Netmin Users"  		)
                        		echo "Networking chosen.";;
  "Back"    			)
                        		return;;
  *             		)
                        		echo "Wrong Choice";;
esac
}
##############################################################
# Sub Menu for System
##############################################################
menusystem()
{
dialog  --item-help \
                --default-item "" \
                --clear \
                --no-cancel\
                --title "System" \
                --menu " Select an Optionn\n\n\n ..." 25 50 11\
                "Change Passwords"         	""      "Change password for system users"\
                "Disk Quotas"               	""      "Enable Quotas for users"\
                "Disk and Network Filesystem"   ""      "Nfs Configuration"\
                "Filesystem Backup"             ""      "Make backup of filesystem in Tar format" \
                "Running Processes" 		"" 	"List all the running Processes"\
		"Shedule Commands" 		"" 	"Shedule commands to be executed later"\
		"Shedule Cron Jobs" 		"" 	"Shedule cron jobs for future"\
		"System Documentation" 		"" 	"Searches system document for any query"\
		"System Logs" 			"" 	"View system logs"\
		"Users and Groups" 		"" 	"User Administrations"\
		"Back"                          ""      "Return to Main Menu" \
                2>$choice2;
choice=`cat $choice2`

case $choice in
  "Change Passwords"      	)
                        		changepasswords;;
  "Disk Quotas"       		)
                                        echo "Netmin ";;
  "Disk and Network Filesystem" )
                                        echo "Netmin ";;
  "Filesystem Backup"       	)
                                        echo "Netmin ";;
  "Running Processes"       	)
                                        echo "Netmin ";;
  "Shedule Commands"       	)
                                        echo "Netmin ";;
  "Shedule Cron Jobs"       	)
                                        echo "Netmin ";;

  "System Documentation"        )
                        		echo "System chosen";;
  "System Logs"     		)
                        		echo "Servers chosen.";;
  "Users and Groups"  		)
                        		echo "Networking chosen.";;
  "Back"    			)
                        		return;;
  *             		)
                        		echo "Wrong Choice";;
esac
}
##############################################################
# Sub menu Servers
##############################################################
menuservers()
{
dialog  --item-help \
                --default-item "" \
                --clear \
                --no-cancel\
                --title "Servers" \
                --menu " Select an Optionn\n\n\n ..." 25 50 11\
                "Apache Webserver"              ""      "Web Server Configurations"\
                "BIND DNS Server"               ""      "BIND DNS Server configurations"\
                "DHCP Server"   		""      "DHCP Server configurations"\
                "Dovecot IMAP/POP3 Server"      ""      "Dovecot IMAP/POP3 Server Configurations" \
                "Read User Mail"             	""      "Read Mails from a user account"\
                "Samba Windows File Sharing"    ""      "Share linux Server in Windows (File Sharing)"\
                "Sendmail Mail Server"          ""      "Sendmail Mail Server Configurations"\
                "Back"                          ""      "Return to Main Menu" \
                2>$choice2;
choice=`cat $choice2`

case $choice in
  "Apache Webserver"            )
                                        echo "Netmin ";;
  "BIND DNS Server"             )
                                        echo "Netmin ";;
  "DHCP Server" 		)
                                        echo "Netmin ";;
  "Dovecot IMAP/POP3 Server"    )
                                        echo "Netmin ";;
  "Read User Mail"           	)
                                        echo "Netmin ";;
  "Samba Windows File Sharing"  )
                                        echo "Netmin ";;
  "Sendmail Mail Server"        )
                                        echo "Netmin ";;
  "Back"                        )
                                        return;;
  *                             )
                                        echo "Wrong Choice";;
esac
}
##############################################################
# Sub menu Networking
##############################################################
menunetworking()
{
dialog  --item-help \
                --default-item "Extended Internet Services" \
                --clear \
                --no-cancel\
                --title "Networking" \
                --menu " Select an Optionn\n\n\n ..." 25 50 11\
                "Extended Internet Services"    ""      "Configure Xinetd"\
                "Linux Firewall"               	""      "Configure Linux Firewall"\
                "NFS Exports"                   ""      "Export File System to NFS "\
                "Network Configuration"      	""      "Network Configuration" \
                "Back"                          ""      "Return to Main Menu" \
                2>$choice2;
choice=`cat $choice2`

case $choice in
  "Extended Internet Services"            )
                                        echo "Netmin ";;
  "Linux Firewall"             	)
                                        echo "Netmin ";;
  "NFS Exports"                 )
                                        echo "Netmin ";;
  "Network Configuration"	)
                                        echo "Netmin ";;
  "Back"                        )
                                        return;;
  *                             )
                                        echo "Wrong Choice";;
esac
}
##############################################################
# Sub Menu Hardware
##############################################################
menuhardware()
{
dialog  --item-help \
                --default-item "GRUB Boot Loader" \
                --clear \
                --no-cancel\
                --title "Hardware" \
                --menu " Select an Optionn\n\n\n ..." 25 50 11\
                "GRUB Boot Loader"    		""      "Configure GRUB Boot Loader"\
                "Partitions on Local Disks"     ""      "Partitions on Local Disks"\
                "System Time"                   ""      "System Time"\
                "Back"                          ""      "Return to Main Menu" \
                2>$choice2;
choice=`cat $choice2`

case $choice in
  "GRUB Boot Loader"            )
                                        echo "Netmin ";;
  "Partitions on Local Disks"              )
                                        echo "Netmin ";;
  "System Time"                 )
                                        echo "Netmin ";;
  "Back"                        )
                                        return;;
  *                             )
                                        echo "Wrong Choice";;
esac
}
##############################################################
#Sub menu Others
##############################################################
menuothers()
{
dialog  --item-help \
                --default-item "Command Shell" \
                --clear \
                --no-cancel\
                --title "Others" \
                --menu " Select an Optionn\n\n\n ..." 25 50 11\
                "Command Shell"              	""      "Run Commands"\
                "Remote Host Login"     	""      "Login into Remote system"\
                "List of Linux commands"	""      "Displays a list of Linux Commands"\
                "Back"                          ""      "Return to Main Menu" \
                2>$choice2;
choice=`cat $choice2`

case $choice in
  "Command Shell"            )
                                        echo "Netmin ";;
  "Remote Host Login"        )
                                        echo "Netmin ";;
  "List of Linux commands"   )
                                        echo "Netmin ";;
  "Back"                     )
                                        return;;
  *                          )
                                        echo "Wrong Choice";;
esac
}


##############################################################
# Manin menu for netmin project
##############################################################
menumain()
{
	dialog	--item-help \
		--default-item "System" \
		--clear \
		--no-cancel\
		--title "Project Netmin" \
		--menu " Select an Optionn\n\n\n ..." 25 50 11\
		"Netmin" 	"" 	"Netmin Configurations"\
		"System" 	"" 	"System Configurations"\
		"Servers" 	"" 	"Servers Configurations"\
		"Networking" 	"" 	"Network Configurations" \
		"Hardware" 	"" 	"Hardware Configurations"\
		"Others" 	"" 	"Other Utilities and commands"\
		"Exit" 		"" 	"Exits Netmin" \
		2>$choice1;
choice=`cat $choice1`

case $choice in
  "Netmin"	)
    			menunetmin;;
  "System" 	)
    			menusystem;;
  "Servers"	)
    			menuservers;;
  "Networking"	)
			menunetworking;;
  "Hardware"	)
                	menuhardware;;
  "Others"	)
                	menuothers;;
  "Exit"	)
                	dialog  --infobox "\n\n\n\n\n\n\nExiting Netmin..\nPlease wait . . . " 25 50;sleep 2; clear; rm -rf tempfiles; exit; ;;

  *		)
    			echo "Wrong Choice";;
esac
}
#############################################################
#        Main Starts
#############################################################
curuser=`whoami`
clear
if [ $curuser != root ]
then
        dialog  --infobox "\n\n\nThis Script can't be run as a normal user\n \n\n\nKindly Logon as ROOT and run this script.. " 25 50;sleep 3; clear; exit;
fi

welcome
temp=1;
while [ $temp != 0 ]
do
	netminauth
	temp=$?;
done;

while [ $temp != 1 ]
do
	menumain;
done;
