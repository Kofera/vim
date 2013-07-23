#!/bin/bash

OUTPUT_FILENAME=.gitmodules

if [ $# -lt 1 ]; then
	echo -e '\033[31mUsage: generate_submodule.sh <dir>\033[0m'
	exit
fi

if [ ! -d "$1/bundle" ]; then
	echo -e "\033[31m$1/bundle does not exist.\033[0m"
	exit
fi

if [ ! -f $OUTPUT_FILENAME ]; then
	touch $OUTPUT_FILENAME
else
	: > $OUTPUT_FILENAME
fi

for file in `find $1 -type f -name config`
do
	DIR=`echo $file | sed 's/\/.git\/config//g'`
	echo -e "\033[32mdealing with \033[0m" $file 
	URL=`awk '/url = / {print $3; exit}' $file`
	git submodule add $URL "$1/bundle"
	echo "[submodule \"$DIR\"]" >> $OUTPUT_FILENAME
	echo -e "\tpath = $DIR" >> $OUTPUT_FILENAME
	echo -e "\turl = $URL" >> $OUTPUT_FILENAME
	echo -e "\tignore = dirty" >> $OUTPUT_FILENAME
done
