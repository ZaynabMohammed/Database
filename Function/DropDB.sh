#! /bin/bash

DropDB_fun(){
array=( $(ls ./Tables/))
echo "Tables names --> ${array[@]}" 
read -p "Enter your DB Name You Want to Drop:" DBName

if [[ (${array[@]} =~ $DBName) ]]
 then
        echo "$(rm -d -f  ./Tables/${DBName})"
	echo  "New DB LIST --> $(ls -F  ./Tables)"
      
 else
        echo "DB is not exist,Try again"
	
 fi      
}


