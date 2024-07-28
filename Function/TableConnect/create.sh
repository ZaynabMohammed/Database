#! /bin/bash

Create_fun(){

 read -p "Enter your Table Name:" TableName
 array=( $(ls ./Databases/$1/))
 if [[ !(${array[@]} =~ $TableName) ]]
 then
	 var=$(CheckRegex_fun "$TableName")
	 if [[ "$var" = "1" ]]
	 then
		cd ./Databases/$1		
 	        touch  ${TableName}
		touch "${TableName}.metadata"
		read -p "Enter coloumns number:" cnum
                echo "Coloumn number: $cnum" >> "${TableName}.metadata"
		for((i=1;i<=${cnum};i++))
		do
	            read -p "Enter coloumn $i name :" cname
                    read -p "Enter coloumn $i type :" type

		    echo "$cname $type" >> "${TableName}.metadata"
		done
	 else
		echo "Invalid!! Try, Again"
		echo "It starts with number!! OR contains special_char!!"
	 fi		
 else
	echo "Table is exist,Try again"
 fi 



}
