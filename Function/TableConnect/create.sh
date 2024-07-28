#! /bin/bash

Create_fun(){

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
		    ## append columns names inside table in same line
		    printf "$cname " >> "${TableName}"
		    echo  "For_type enter int OR string"
                    
		    read -p "Enter coloumn $i type :" Type
		    #echo "$Type"
		    ## give user another try to enter type if he entered a wrong type
		    if [[ !(${typearray[@]} =~ $Type) ]]
		    then
			echo  "For_type enter int OR string"
			read -p "Enter coloumn $i type :" Type
		    else
			echo "$cname $Type" >> "${TableName}.metadata"
			continue
		    fi	
		    
		    echo "$cname $Type" >> "${TableName}.metadata"
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

