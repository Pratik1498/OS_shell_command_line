#!/bin/bash

while [ 1 ]; do
	echo -e "\nHotel Management"
	echo -e "==========\n"

	echo -e "Please select an option from the following: \
	         \n\t1) Insert\n\t2) Display All\n\t3) Search\n\t4) Delete\n\t5) Exit\n"
	echo "Enter your choice: "
	read choice

	case $choice in
		1)
			echo -e "\nINSERT:"
			echo -n "Enter the Customer Name: "
			read name
			echo -n "Enter the Customer ID: "
			read ID
			echo -n "Enter the Phone Number: "
			read no
			echo -n "Enter the Room Type: "
			read roomt
			echo -n "Enter the Price: "
			read price
			echo -e "$name\t$ID\t$no\t$roomt\t $price" >> contacts.csv;;
			
	
		2)
			echo -e "\nALL RECORDS:"
			if [ -e contacts.csv ]; then
				echo -e "Name\tID          no          roomt   price"
				cat contacts.csv
			else
				echo "Sorry, no records found."
			fi;;

		3)
			echo -e "\nSEARCH:"
			echo -n "Enter the query: "
			read query
			echo -n "Search by name or number (enter 1 for name, anything else for number): "
			read method

			retval=$(cat contacts.csv | awk -v q="$query" -v meth="$method" '{
				FS="\t"
				if( (meth == 1 && tolower($1) == tolower(q)) ||
				    (meth != 1 && tolower($2) == tolower(q)) )
				{
					print "Name: " $1
					print "ID: " $2
					print "Phone No: " $3
					print "Room Type: " $4
					print "Price: " $5
					
				}
			}')

			if [ -n "$retval" ]; then
				echo -e "\n$retval\n"
			else
				echo "Sorry, $query not found."
			fi
			echo "Press Enter to continue..."
			read something;;

		4)
			echo -e "\nDELETE:"
			echo -n "Enter the name: "
			read name

			if [ -e contacts_tmp.csv ]; then
				rm contacts_tmp.csv
			fi

			cat contacts.csv | awk -v name="$name" '{
				if(tolower($1) != tolower(name)) {
					print $line
				}
			}' > contacts_tmp.csv

			mv contacts_tmp.csv contacts.csv;;

		5)	exit;;

		*)
			echo "Invalid choice.";;
	esac
done
