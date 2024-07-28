#! /bin/bash

function CheckStringType_fun (){

if [[ $1 =~ ^[a-zA-Z]+$ ]] 
then
	echo "1"
else
	echo "2"
fi	
}
