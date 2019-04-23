# Phonebook Microproject for OS LAB : 6th Semester
# Version: 2.0
# Author: oishikm | 23 April 2019

# Project Entries (Options) :
#	1 (Q4). Change phone number for a person.
#	2 (Q5). Change email for a person.
#	3 (Q6). Change address for a person.
#	4 (Q7). Change Aadhaar number for a person.
#	5 (Q8). Find out relative’s details for a person.

#!/bin/bash

IFS=', '	# Internal Field Separator
reset;		# Resets Screen

while true; do
	clear
	choice=0
	echo -e "\n--PHONEBOOK--"
	
	echo -e "\n\n1 (Q4). Change phone number for a person.\n\n2 (Q5). Change email for a person.\n\n3 (Q6). Change address for a person. "
	echo -e "\n4 (Q7). Change Aadhaar number for a person.\n\n5 (Q8). Find out relative’s details for a person.\n\n0. Exit. \n"
	
	read -p "Enter choice : " choice
	
	case $choice in
		1)	# Change phone number for a person
			touch temp_name.csv
		
			>temp_name.csv
		
			read -p "Enter old phone number : " old_phone;
			read -p "Enter new phone number : " new_phone;
			
			file=databases//name.csv
			flag=0
			
			while read -r aadhaar name phone
			do
        		if [[ "$phone" == "$old_phone" ]]
	        		then 
	        			flag=1
	        			echo "Found record in Names Database. Updated."
	        			echo -e "$old_phone changed to $new_phone for $name (Aadhaar : $aadhaar).\n"
	        			echo "$aadhaar, $name, $new_phone" >> temp_name.csv
        		else
    				echo "$aadhaar, $name, $phone" >> temp_name.csv
    			fi    		
			done <"$file"
			if [ $flag -eq 0 ]; then
				echo "No matching records found."
			fi
			rm databases//name.csv
			mv temp_name.csv databases//name.csv
			
			echo -e "\nPress Enter to continue.\n"
			read something;
			;;
		
		2)	# Change email for a person
			touch temp_email.csv
		
			>temp_email.csv
		
			read -p "Enter old email : " old_email;
			read -p "Enter new email : " new_email;
			
			file=databases//email.csv
			flag=0
			
			while read -r aadhaar email
			do
        		if [[ "$email" == "$old_email" ]]
	        		then 
	        			flag=1
	        			echo "Found record in Email Database. Updated."
	        			echo -e "$old_email changed to $new_email for Aadhaar holder : $aadhaar.\n"
	        			echo "$aadhaar, $new_email" >> temp_email.csv
        		else
    				echo "$aadhaar, $email" >> temp_email.csv
    			fi    		
			done <"$file"
			if [ $flag -eq 0 ]; then
				echo "No matching records found."
			fi
			rm databases//email.csv
			mv temp_email.csv databases//email.csv
			
			echo -e "\nPress Enter to continue.\n"
			read something;
			;;
		
		3) 	# Change address for a person
			touch temp_address.csv
		
			>temp_address.csv
		
			read -p "Enter aadhaar number : " find_aadhaar;
			read -p "Enter new address : " new_address;
			
			file=databases//address.csv
			flag=0
			
			while read -r aadhaar address
			do
        		if [[ "$aadhaar" == "$find_aadhaar" ]]
	        		then 
	        			flag=1
	        			echo "Found record in Address Database. Updated."
	        			echo -e "$address changed to $new_address for Aadhaar holder : $aadhaar.\n"
	        			echo "$aadhaar, $new_address" >> temp_address.csv
        		else
    				echo "$aadhaar, $address" >> temp_address.csv
    			fi    		
			done <"$file"
			if [ $flag -eq 0 ]; then
				echo "No matching records found."
			fi
			rm databases//address.csv
			mv temp_address.csv databases//address.csv
			
			echo -e "\nPress Enter to continue.\n"
			read something;
			;;
		
		4)	# Change Aadhaar number for a person
			# Aadhaar number is primary key, so all databases need to be updated
			touch temp_name.csv temp_address.csv temp_email.csv
			
			>temp_name.csv
			>temp_address.csv
			>temp_email.csv
			
			read -p "Enter old aadhaar : " old_aadhaar;
			read -p "Enter new aadhaar : " new_aadhaar;
			
				# (1) Address database
			file=databases//address.csv
			flag=0
			
			while read -r aadhaar address
			do
        		if [[ $aadhaar == $old_aadhaar ]]
	        		then 
	        			flag=1
	        			echo "Found record in Address Database. Updated."
	        			echo -e "$old_aadhaar changed to $new_aadhaar.\n"
	        			echo "$new_aadhaar, $address" >> temp_address.csv
        		else
    				echo "$aadhaar, $address" >> temp_address.csv
    			fi    		
			done <"$file"
			if [ $flag -eq 0 ]; then
				echo "No matching records found in Address Database."
			fi
			rm databases//address.csv
			mv temp_address.csv databases//address.csv
			
			
				# (2) Email database
			file=databases//email.csv
			flag=0
			
			while read -r aadhaar email
			do
        		if [[ $aadhaar == $old_aadhaar ]]
	        		then 
	        			flag=1
	        			echo "Found record in Email Database. Updated."
	        			echo -e "$old_aadhaar changed to $new_aadhaar.\n"
	        			echo "$new_aadhaar, $email" >> temp_email.csv
        		else
    				echo "$aadhaar, $email" >> temp_email.csv
    			fi    		
			done <"$file"
			if [ $flag -eq 0 ]; then
				echo "No matching records found in Email Database."
			fi
			rm databases//email.csv
			mv temp_email.csv databases//email.csv
			
				# (3) Name database
			file=databases//name.csv
			flag=0
			
			while read -r aadhaar name phone
			do
        		if [[ $aadhaar == $old_aadhaar ]]
	        		then 
	        			flag=1
	        			echo "Found record in Names Database. Updated."
	        			echo -e "$old_aadhaar changed to $new_aadhaar.\n"
	        			echo "$new_aadhaar, $name, $phone" >> temp_name.csv
        		else
    				echo "$aadhaar, $name, $phone" >> temp_name.csv
    			fi    		
			done <"$file"
			if [ $flag -eq 0 ]; then
				echo "No matching records found in Name Database."
			fi
			rm databases//name.csv
			mv temp_name.csv databases//name.csv
			
			echo -e "\nPress Enter to continue.\n"
			read something;
			;;
		
		5)	# Find out relative’s details for a person
			read -p "Enter whose relative to display : " search_name
			
			found_name=NULL
			found_aadhaar=NULL
			
			file=databases//relative.csv
			ctr=0
			
			while read -r name relative_name
			do
				if [[ $name == $search_name ]]
					then
						ctr=`expr $ctr + 1`
						echo -e "\n\nFound relative : $ctr"
						found_name=$relative_name 
						file2=databases//name.csv
			
						while read -r aadhaar name phone
						do
        					if [[ $name == $found_name ]]
	        					then 
				        			found_aadhaar=$aadhaar
	    			    			echo -e "\nAadhaar : $aadhaar, Name : $name, Phone number : $phone" 
    						fi    		
						done <"$file2"
				
						file2=databases//email.csv
				
						while read -r aadhaar email
						do
        					if [[ $aadhaar == $found_aadhaar ]]
	    			    		then 
	    			    			echo -e "\nEmail : $email" 
    						fi    		
						done <"$file2"
			
						file2=databases//address.csv
				
						while read -r aadhaar address
						do
        					if [[ $aadhaar == $found_aadhaar ]]
	    			    		then 
	    			    			echo -e "\nAddress : $address" 
    						fi    		
						done <"$file2"
				fi
			done <"$file"
			
			if [ $ctr -eq 0 ]; then
				echo "No records found."
			fi
			
			echo -e "\nPress Enter to continue.\n"
			read something;
			;;
		
		0)  # Exit	
			reset; 
			exit;;
	esac
done
