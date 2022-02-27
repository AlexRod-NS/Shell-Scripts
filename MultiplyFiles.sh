#!/bin/bash

create(){
    local FILE=$1
    local path=$2
    local REPEAT=$3
    for i in $(seq 1 $REPEAT);do
	NFILE=${FILE/./$i.}
	touch $path/$NFILE
     done
}

if [[ $1 == "-r" ]] && [[ -d $2 ]];then
    for i in $(ls $2);do
	if [[ -f $2$i ]]; then
	     create $i $3 $4
	fi
    done
elif [[ -f $1 ]];then
    num=$(echo -n $1 | grep -Fo "/" | wc -l)
    FILE_WITHOUT_PATH=$(cut -d / -f $(($num+1)) <<< $1)
    create $FILE_WITHOUT_PATH $2 $3
fi

