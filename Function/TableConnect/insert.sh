#! /bin/bash

source ./Validation/CheckIntType.sh
source ./Validation/CheckStringType.sh

unique_value_fun () {

  ####will write code here
}

Insert_fun(){
read -p "Enter your Table Name:" TableName
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
	else
		col_arry+=($c1)	
		type_arry+=($c2)
        fi

done < "${TableName}.metadata"	

#echo "${primary_key[@]}"
#echo "${type_arry[@]}"

###### insert into Table ##########
for ((i=0;i<${#col_arry[@]};i++))
do       
read -p "Enter your value to ${col_arry[i]} column with type ${type_arry[i]}:" value
#### Check if current col is primary key or not #######
if [[ "${col_arry[i]}"  == "${primary_key[0]}" ]]
then
	#check if value is unique
	unique_value_fun "$value"
fi
if [[ "${type_arry[i]}"  == "int" ]]
then 
	var=$(CheckIntType_fun "$value")
	if [[ "$var" == "1" ]]
	then
		printf "$value " >> "${TableName}"
	else
		echo "TRY, AGAIN!!! The value doesn't contain only numbers"
	fi
else
	var=$(CheckStringType_fun "$value")
	if [[ "$var" == "1" ]]
        then
        	printf "$value " >> "${TableName}"
        else
       		echo "TRY, AGAIN!!! The value doesn't contain only chracters"
        fi	       
fi	
done
	
echo " " >> "${TableName}"
}


