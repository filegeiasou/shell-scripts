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

cd $1

#dbfolders
for ((i=1;i<=$2;i++))
do
k=1
if [  -d "dbfolder$i" ]; then
k=0
fi

if [ $k -eq 1 ]; 
then
mkdir dbfolder$i
else
echo "$0 : The Folder dbfolder$i is already EXISTS"
fi

done

#datafolders
for ((i=1;i<=$3;i++))
do
k=1
if [  -d "datafolder$i" ]; then
k=0
fi

if [ $k -eq 1 ]; 
then
mkdir datafolder$i
else
echo "$0 : The Folder datafolder$i is already EXISTS"
fi

done
