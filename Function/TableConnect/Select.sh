#! /bin/bash

Select_fun()
{
  # cd ./Databases/$1
    ls ./Databases/$1
 read -p "Enter your Table Name:" TableName
 array=($(ls ./Databases/$1))
if [[ !(${array[@]} =~ $TableName) ]]
then
    echo "not exist"
else
    cd ./Databases/$1
   # ls
       select item in "Select All" "Select By Any Field In Table" "Back"
do 
	case $item in
	       	"Select All")
                awk '{print $0}' $TableName
 
			;;
	   	"Select By Any Field In Table")
			     read -p "Select by:" sby
                              awk -v var="${sby}"  '{IGNORECASE = 1; for ( i=0 ; i<=NF ; i++) if ($i==var) {print $0}}' $TableName
 
                	;;
		"Back")
                        cd ../../
			ConnectDB_fun $1
      			;;		
	esac
done
fi
cd ../../
}
