#! /bin/bash

source ./Validation/CheckRegex.sh

function CreateDB_fun (){
 read -p "Enter your DB Name:" DBName
 array=( $(ls ./Tables/))
 if [[ !(${array[@]} =~ $DBName) ]]
 then
	 var=$(CheckRegex_fun "$DBName")
	 if [[ "$var" = "1" ]]
	 then
 		$(mkdir ./Tables/$DBName/)
	 else
		echo "Invalid!! Try, Again"
		echo "It starts with number!! OR contains special_char!!"
	 fi		
 else
	echo "DB is exist,Try again"
 fi 	 

}	

