#! /bin/bash

source ./Validation/CheckIntType.sh
source ./Validation/CheckStringType.sh

Insert_fun(){
#echo $(pwd)
read -p "Enter your Table Name:" TableName
array=( $(ls ./Databases/$1/) )
if [[ (${array[@]} =~ $TableName) ]]
then
	cd ./Databases/$1
	col_arry=()
	type_arry=()
	primary_key=()

	while read c1 c2 c3
	do
		if [[ "$c1" == "Column_number:" ]]
        	then
                	continue
		elif [[ "$c3" == "primarykey" ]]
		then		
			primary_key+=($c1)	
			col_arry+=($c1)	
			type_arry+=($c2)
		else
			col_arry+=($c1)	
			type_arry+=($c2)
        	fi

	done < "${TableName}.metadata"	

	###### insert into Table ##########
	for ((i=0;i<${#col_arry[@]};i++))
	do
	flag="N" 	
	read -p "Enter your value to ${col_arry[i]} column with type ${type_arry[i]}:" value
	#### Check if current col is primary key or not #######
	if [[ "${col_arry[i]}"  == "${primary_key[0]}" ]]
	then    
	
		#check if value is unique
		varr=$[i+1]
		arry2=($(awk -v numCol=$varr '{print $numCol}' "${TableName}"))
		if [[ (${arry2[@]} =~ $value) ]]
		then
			flag="Y"
			echo "your value is exist, Try Again "
			break
		fi	
	fi
	if [[ "${type_arry[i]}"  == "int" ]]
	then 
		var=$(CheckIntType_fun "$value")
		if [[ "$var" == "1" ]]
		then
			printf "$value " >> "${TableName}"
		else
			echo "TRY, AGAIN!!! The value doesn't contain only numbers"
                        flag="Y"
			break
		fi
	else
		var=$(CheckStringType_fun "$value")
		if [[ "$var" == "1" ]]
        	then
        		printf "$value " >> "${TableName}"
        	else
       			echo "TRY, AGAIN!!! The value doesn't contain only chracters"
                        flag="Y"
			break
       		 fi	       
	fi	
	done
	##append new line
	if [[ "$flag" != "Y" ]]
	then	
 		echo " " >> "${TableName}"
	fi	
	 cd ../../
else
	echo "You enter unexisted table, try again"
fi

}
