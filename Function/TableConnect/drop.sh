#! /bin/bash

Drop_fun(){

array=( $(ls ./Databases/$1))
echo "Tables names --> ${array[@]}" 
read -p "Enter your Table Name You Want to Drop:" TableName

if [[ (${array[@]} =~ $TableName) ]]
 then
        echo "$(rm -f  ./Databases/$1/${TableName})"
        echo "$(rm -f  ./Databases/$1/${TableName}.metadata)"
	echo  "New DB LIST --> $(ls ./Databases/$1)"
      
 else
        echo "DB is not exist,Try again"
	
 fi
      
}
