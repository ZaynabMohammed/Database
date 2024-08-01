#! /bin/bash

Create_fun(){

 flag="No"
 read -p "Enter your Table Name:" TableName
 array=( $(ls ./Databases/$1/))
 typearray=( "int" "string" )
 if [[ !(${array[@]} =~ $TableName) ]]
 then
	 var=$(CheckRegex_fun "$TableName")
	 if [[ "$var" = "1" ]]
	 then
		cd ./Databases/$1		
 	        touch  ${TableName}
		touch "${TableName}.metadata"
		read -p "Enter coloumns number:" cnum
                echo "Column_number: $cnum" >> "${TableName}.metadata"
		
		for((i=1;i<=${cnum};i++))
		do
	            read -p "Enter coloumn $i name :" cname
		    if [[ "$flag" == "No" ]]
	            then
			echo "hello"		    
     		    	## Ask user if want this column to act as a primary_key
		    	read -p "IF U want this column to be a primary key Enter[Y/N]: " choice
			if [[ "$choice" == "Y" || "$choice" == "y" ]]
		        then
				flag="Yes"
		        fi		    
		    fi
		    ## append columns names inside table in same line
		    printf "$cname " >> "${TableName}"
		    echo  "For_type enter [int OR string]"
                    read -p "Enter coloumn $i type :" Type
		   	
		    ######################################################################
		     ## give user another try to enter type if he entered a wrong type
		    if [[ !(${typearray[@]} =~ $Type) ]]
		    then
			echo  "For_type enter [int OR string]"
			read -p "Enter coloumn $i type :" Type
		    fi	
		    ######################################################################
		    if [[ "$flag" == "Yes" && ("$choice" == "Y" || "$choice" == "y") ]]
		   then 
			choice="N"
			echo "$cname $Type primarykey" >> "${TableName}.metadata"
	           else  	
		        echo "$cname $Type" >> "${TableName}.metadata"
		   fi	
		done
		#to append new line 
		echo " " >> "${TableName}"

	 else
		echo "Invalid!! Try, Again"
		echo "It starts with number!! OR contains special_char!!"
	 fi		
 else
	echo "Table is exist,Try again"
 fi 

}

