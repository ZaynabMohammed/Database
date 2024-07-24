#! /bin/bash

source ./Function/ConnectDB.sh  
source ./Function/CreateDB.sh
source ./Function/DropDB.sh
source ./Function/ListDB.sh

select item in "Create" "List" "Drop" "Connect";
 do 

	case $item in
	   "Create")
		;;

	   "List")
             ;;
            "Drop")
              ;; 
             "Connect")
	      hi
              ;;

 esac
done

