#! /bin/bash

source ./Function/TableConnect/create.sh
source ./Function/TableConnect/delete.sh
source ./Function/TableConnect/drop.sh
source ./Function/TableConnect/insert.sh
source ./Function/TableConnect/list.sh
source ./Function/TableConnect/Select.sh
source ./Function/TableConnect/update.sh
#source ../main.sh
ConnectDB_fun(){
echo $(pwd)
array=( $(ls ./Databases/))
echo "Tables names --> ${array[@]}" 
read -p "Enter your DB Name You Want to connect to:" DBName

if [[ (${array[@]} =~ $DBName) ]]
 then  
	
       select item in "Insert" "Update" "Select" "Delete" "Create" "List" "Drop" "Back"
do 
	case $item in
	       	"Insert")
			Insert_fun ${DBName}
		        #cd ../../
			;;
	   	"Update")
			Update_fun ${DBName}
		       # cd ../../	
                	;;
           	"Select")
	      		Select_fun ${DBName} 
                	;;
	       	"Delete")
	      		Delete_fun ${DBName} 
                	;;
          	"List")
	      		List_fun ${DBName} 

                	;;
		 "Create")
	      		Create_fun ${DBName}
		       # cd ../../	
                        
                	;;
	     	"Drop")
			Drop_fun ${DBName} 
                	;; 
		"Back")
			main_fun "back"
      			;;		
	esac
done

 else
        echo "DB is not exist,Try again"

 fi      
#echo $(pwd)
}


#exec bash



