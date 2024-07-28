#! /bin/bash

function CheckIntType_fun(){

if [[ $1 =~ ^[0-9]+$ ]] 
then
    echo "1"
else
    #echo "TRY, AGAIN!!! The value doesn't contain only numbers"
     echo "2"
fi

}
