#! /bin/bash

source cd
ConnectDB_fun(){
array=( $(ls ./Databases/))
echo "Tables names --> ${array[@]}" 
read -p "Enter your DB Name You Want to connect to:" DBName
#alias proj="cd ./Databases/${DBName}"

if [[ (${array[@]} =~ $DBName) ]]
 then  
	
       select item in "Insert" "Update" "Select" "Delete" "Create" "List" "Drop" "exit"
do 
	case $item in
	       	"Insert")
			Insert_fun
			;;
	   	"Update")
			Update_fun
                	;;
      
           	"Select")
	      		Select_fun
                	;;
	       	"Delete")
	      		Delete_fun
                	;;
          	"List")
	      		List_fun
                	;;
		 	"Create")
	      		List_fun
                	;;
	     	"Drop")
			Drop_fun
                	;; 
		"exit")
			exit
      			;;		
	esac
done

 else
        echo "DB is not exist,Try again"

 fi      
}


#exec bash



