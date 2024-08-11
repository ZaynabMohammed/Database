#! /bin/bash

#source ./Database/Function/ConnectDB.sh

function delete_table () {
echo "$(rm -f $1)"
}

function delete_row () {
primary_key=()

while read c1 c2 c3
do
	if [[ "$c3" == "primarykey" ]]
	then		
		primary_key+=($c1)	
        fi

done < "$1.metadata"

echo "Will delete row based on a primarykey value"
read -p "Enter value of ${primary_key[0]} column: " val
grep "$val" "$1" >/dev/null
if [ $(echo "$?") -eq "0" ]
then
	sed -i "/$val/d" "$1" &>/dev/null
else
	echo "You enter unexisted value"

fi	
}
function delete_column () {
col_arry=()	
while read c1 c2 c3
do
if [[ "$c1" == "Column_number:" ]]
then
	continue
else
	col_arry+=($c1)
fi	
done < "$1.metadata"
## read A column name and check it this column exist
read -p "Enter column name U want to delete: " col
if [[ (${col_arry[@]} =~ "$col") ]]
then	
	#get index of input column
	for i in "${!col_arry[@]}"
	do
		if [[ "${col_arry[$i]}" == "$col" ]]
		then
			var=$[i+1]
			##delete column with awk
			awk -v numCol=$var '{sub($numCol, ""); gsub(/  +/, " "); print $0}' "$1" > temp.txt
			mv temp.txt "$1"
	 		break
		fi
	done


else
	echo "you entered unexisted column name"
fi	
}

function Delete_fun () {
	DB=$1
	array=( $(ls ./Databases/$DB/) )
echo "Tables names --> ${array[@]}"
read -p "Enter your Table Name:" table

if [[ (${array[@]} =~ $table) ]]
 then

       select item in "Delete Table" "Delete Row" "Delete Column" "back"
	do
		case $item in
	       		"Delete Table")
				cd ./Databases/$DB/
				delete_table ${table}
				cd ../../
				;;
	   		"Delete Row")
				cd ./Databases/$DB/
				delete_row ${table}
                		cd ../../
				;;
           		"Delete Column")
				cd ./Databases/$DB/
	      			delete_column ${table}
				cd ../../
                		;;
			"back")
				ConnectDB_fun
      				;;
		esac
	done

 else
        echo "Table is not exist,Try again"

 fi

}

