#! /bin/bash

function List_fun(){

   echo "List of Tables"
    array=($(ls ./Databases/$1))
#    echo  ${array[@]}
 
   for item in ${array[@]}
do 
    if [[ $item =~ [".metadata"]$ ]]
  then  
       continue 
   else
      echo $item
fi
done
}

