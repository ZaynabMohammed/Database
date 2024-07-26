#! /bin/bash

ConnectDB_fun(){
array=( $(ls ./Tables/))
echo "Tables names --> ${array[@]}" 
read -p "Enter your DB Name You Want to connect to:" DBName
#alias proj="cd ./Tables/${DBName}"

if [[ (${array[@]} =~ $DBName) ]]
 then  
	
        echo "$(cd ./Tables/${DBName})"
        echo "tes"
       # echo $(.proj)

 else
        echo "DB is not exist,Try again"

 fi      
}





