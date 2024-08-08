#! /bin/bash

source ./Function/ConnectDB.sh  
source ./Function/CreateDB.sh
source ./Function/DropDB.sh
source ./Function/ListDB.sh

function main_fun (){
select item in "Create" "List" "Drop" "Connect" "exit"
do 
	case $item in
	       	"Create")
			CreateDB_fun
			;;
	   	"List")
			ListDB_fun
                	;;
           	"Drop")
			DropDB_fun
                	;; 
           	"Connect")
	      		ConnectDB_fun
                	;;
		"exit")
			exit
      			;;		


	esac
done
}

if [[ "$1" != "back" ]]
then 
main_fun
fi

