#! /bin/bash
source ./Validation/CheckIntType.sh
source ./Validation/CheckStringType.sh

Update_fun (){
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
	
	echo "**Enter the value you want to update**"
	read -p "Enter its column name: " col
	read -p "Enter its value: " val
	read -p "Enter your new value: " newval


	#get index of col
	for i in "${!col_arry[@]}"
	do
      		if [[ "${col_arry[$i]}" == "$col" ]]
		then
			 var=$i
       			 break  # Exit loop once value is found
    		fi
	done
	
	val_type="N"	
	### check type of new value
	if [[ "int" == "${type_arry[$var]}" ]]
	then
		v=$(CheckIntType_fun "$newval")
		if [[ "$v" == "1" ]]
		then
			val_type="Y"
		else
			echo "TRY, AGAIN!!! The value doesn't contain only numbers"
		fi		
	else
		v=$(CheckStringType_fun "$newval")
                if [[ "$v" == "1" ]]
                then
                        val_type="Y"
                else
                        echo "TRY, AGAIN!!! The value doesn't contain only numbers"
                fi	

	fi

	# if col is primary key, check that val is unique 
	if [[ "$col" == "${primary_key[0]}" ]]
	then 
		#check if value is unique
		var2=$[var+1]
		arry2=($(awk -v numCol=$var2 '{print $numCol}' "${TableName}"))	
		if [[ (${arry2[@]} =~ $newval) ]]
		then
			echo "your value isn't unique, Try Again "
		elif [[ "$val_type" == "Y" ]]
		then
			grep "$val" "${TableName}" >/dev/null
               		if [ $(echo "$?") -eq "0" ]
               		then
                        	sed -i "s/$val/$newval/" "${TableName}"
                	else
                        	echo "you entered unexisted value"
                	fi
		fi		
	
	elif [[ "$val_type" == "Y" ]]
	then
		grep "$val" "${TableName}" >/dev/null
		if [ $(echo "$?") -eq "0" ]
		then
			sed -i "s/$val/$newval/" "${TableName}"
		else
			echo "you entered unexisted value"
		fi	
	fi
else
	echo "Try Again, table doesn't exist"
fi	
#echo "$(pwd)"
}	
