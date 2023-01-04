#!bin/bash
declare -i x=$1 
declare -i y=$2
ans=1
declare -a array 
i1=0
i2=0
i3=0
i4=0
i5=0
while [ $ans -eq 1 ] 
do
echo "Give Directory : " ; read catalog  
if [ ! -d $catalog ] 
then
echo "Directory dont found"
else
x1=$(find $catalog -perm $1 | wc -l)
echo "1. Αρχεία του δέντρου του καταλόγου $catalog με εξουσιοδοτήσεις $1. ($x1)"
let i1=i1+x1
array[1]=$i1
x2=$(find $catalog/* -mtime -$2 | wc -l)
echo "2. Αρχεία του δέντρου του καταλόγου $catalog που άλλαξαν περιεχόμενα κατά τις $2 τελευταίες μέρες. ($x2)"
find $catalog/* -mtime -$2
let i2=i2+x2
array[2]=$i2
x3=$(find $catalog/* -type d -atime -$2 | wc -l)
echo "3. Υποκατάλογοι του καταλόγου $catalog που προσπελάστηκαν κατά τις $2 τελευταίες μέρες. ($x3)"
let i3=i3+x3
array[3]=$i3
x4=$(ls -l $catalog | grep ".r..r..r.." | wc -l)
echo "4. Αρχεία του καταλόγου $catalog στα οποία έχουν δικαίωμα ανάγνωσης όλοι οι χρήστες. ($x4)"
ls -l $catalog | grep ".r..r..r.."
let i4=i4+x4
array[4]=$i4
x5=$(ls -l $catalog | grep "d.w..w..w." | wc -l)
echo "5. Υποκατάλογοι του καταλόγου $dir στους οποίους έχουν δικαίωμα αλλαγών εκτός από τον ιδιοκτήτη και άλλοι χρήστες του συστήματος. ($x5)"
ls -l $catalog | grep "d.w..w..w."
let i5=i5+x5
array[5]=$i5
fi
echo "Continue (0/1)"
read ans
done
for ((k=1;k<=5;k++))
do
echo "Συνολικός αριθμός ευρεθέντων αρχείων/υποκαταλόγων για την περίπτωση $k: ${array[k]}"
done
