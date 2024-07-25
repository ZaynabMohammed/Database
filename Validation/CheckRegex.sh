#! /bin/bash
function CheckRegex_fun (){

	if [[ (! $1 =~ ^[0-9]) && ($1 =~ ^[a-zA-Z0-9]*$) && ($1 =~ [a-zA-Z0-9]$) ]]
  	then	 
		echo "1"
		 
 	else
		echo "0"
	 fi

}

