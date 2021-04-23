#!/bin/sh

#error carching part
#here the user only called the script with no arguments
if [ $# -ne 1 ] ; then #need to add a semicolon before then if on the same line
	read -p "Please enter file path: " filepath #-p print the prompt

else filepath=$1
fi

if [ ! -f "$filepath" ] ; then #check if file exists, if it doesn't, prompt for correct path
	read -p "Please enter a correct file path: " filepath #-p print the prompt
	else read -p "Please enter option: -t: print header line / -n: print number of lines in the file excluding header / -d: display file content / -s search for a name and display info -e: exit: " op
fi
case $op in #if the first argument is

	-t) #print header line
		head -1 $filepath
		;;
	-n) #print number of lines in the file excluding the header
		count=$(wc -l $filepath) 
		((count=count-1))
		echo $count
		;;
	-d) #display file content
		cat $filepath
		;;
	-s) #search for name
		read -p "Please enter name: " name
		grep -E ^["${name}"] $filepath
		#grep exit status 1: no line was selected
		status=$?
		if $status=1
			echo "name not found"
			exit 1
		fi
		;;
	-e) #exit
		exit 0
		;;
	#default #here the user did specify an argument but it's not one of them
	*)
		echo "Invalid argument" >&2
		exit 1
esac 


