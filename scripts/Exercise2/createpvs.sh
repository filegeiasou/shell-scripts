#!bin/bash 

# check if use 4 parameters
if [ $# != 4 ] ; then 
	echo "$0: $0 wants 4 parameter " >&2
	exit 1 
fi

if [ ! -d $1 ]; then
	echo "$0: Folder $1 not found " >&2
	exit 2
fi 

getent passwd $4 > /dev/null 2&>1
if [ ! $? -eq 0 ] ; then
	echo "$0 : User $4 not found"
	exit 3 
fi

#dbfolders
cnt=0
a=$(find $1 -type d -name "dbfolder*" | grep -o "[0-9]*$" |  wc -l)
for ((i=1;i<=a;i++))
do
	if [ $a -eq 0 ]
	then
		cnt=0
	else 
		let cnt++
	fi
done
for ((i=cnt+1;i<=cnt+$2;i++))
do
	mkdir $1/dbfolder$i
done

#datafolders
cnt=0
a=$(find $1 -type d -name "datafolder*" | grep -o "[0-9]*$" | wc -l)
for ((i=1;i<=a;i++))
do
	if [ $a -eq 0 ]
	then
		cnt=0
	else 
		let cnt++
	fi
done
for ((i=cnt+1;i<=cnt+$3;i++))
do
	mkdir $1/datafolder$i
	chown $4 $1/datafolder$i
done
