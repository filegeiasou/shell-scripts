#!bin/bash
declare -i x=$1 
declare -i y=$2
ans=1
declare -a array 
while [ $ans -eq 1 ] 
do
	echo "Give Directory : " ; read catalog  
	if [ ! -d $catalog ] 
	then
		echo "Directory dont found"
	else
		x1=$(find $catalog -perm $1 | wc -l)
		echo "1. Αρχεία του δέντρου του καταλόγου $catalog με εξουσιοδοτήσεις $1. ($x1)"
		let array[1]=array[1]+x1
		
		x2=$(find $catalog/* -mtime -$2 | wc -l)
		echo "2. Αρχεία του δέντρου του καταλόγου $catalog που άλλαξαν περιεχόμενα κατά τις $2 τελευταίες μέρες. ($x2)"
		find $catalog/* -mtime -$2
		let array[2]=array[2]+x2
		
		x3=$(find $catalog/* -type d -atime -$2 | wc -l)
		echo "3. Υποκατάλογοι του καταλόγου $catalog που προσπελάστηκαν κατά τις $2 τελευταίες μέρες. ($x3)"
		let array[3]=array[3]+x3
		
		x4=$(ls -l $catalog | grep ".r..r..r.." | wc -l)
		echo "4. Αρχεία του καταλόγου $catalog στα οποία έχουν δικαίωμα ανάγνωσης όλοι οι χρήστες. ($x4)"
		ls -l $catalog | grep ".r..r..r.."
		let array[4]=array[4]+x4
		
		x5=$(ls -l $catalog | grep "d.w..w..w." | wc -l)
		echo "5. Υποκατάλογοι του καταλόγου $dir στους οποίους έχουν δικαίωμα αλλαγών εκτός από τον ιδιοκτήτη και άλλοι χρήστες του συστήματος. ($x5)"
		ls -l $catalog | grep "d.w..w..w."
		let array[5]=array[5]+x5
	fi
	echo "Continue (0/1)"
	read ans
done
for ((k=1;k<=5;k++))
do
	echo "Συνολικός αριθμός ευρεθέντων αρχείων/υποκαταλόγων για την περίπτωση $k: ${array[k]}"
done
