#! /bin/bash

Select_fun()
{
 read -p "Enter your Table Name:" TableName
 array=($(ls ./Databases/$1))
 
if [[ !(${array[@]} =~ $TableName) ]]
then
    echo "not exist"
else
set -x
    cd ./Databases/$1
    ls
     read -p "Select by:" sby
     awk  '{for ( i=0 ; i<=NF ; i++) if ($i=="id") {print $0}}' $TableName
set +x
fi

}
