#!/bin/bash

# Έλεγχος για το συνολικό αριθμό των όρισμάτων
if [ $# -lt 4 ]
then
	echo "Χρησιμοποιήστε το script με την παρακάτω μορφή:"
	echo "bck user source_directory destination_directory time "
else
	user=$1
	source_dir=$2
	destination_dir=$3
	scheduled_time=$4
	if id "$user" >/dev/null 2>&1
	then
		echo 1
	else
		echo "Ο χρήστης "$user" δεν υπάρχει."
		exit 0
	fi
	# Έλεγχος για την ύπαρξη του καταλόγου προέλευσης
	if [ -d "$source_dir" ] || [ -f "$source_dir" ]
	then
		echo 2
	else	
		echo "Ο κατάλογος προέλευσης "$source_dir" δεν υπάρχει."
		exit 1
	fi
	# Έλεγχος για την ύπαρξη του καταλόγου προορισμού
	if [ -d "$destination_dir" ] || [ -f "$destination_dir" ]
	then
	# Δημιουργία αντίγραφου με τη χρήση της εντολής "tar"
		# Αντιγραφή του αντίγραφου στον κατάλογο προορισμού
		if [ -f "$destination_dir" ]
		then
			echo "tar -cf cat $user.tar >> $destination_dir" | at now +$scheduled_time minutes
		elif [ -d "$destination_dir" ]
		then
			echo "tar -cf $user.tar $destination_dir ; cp $user.tar $destination_dir  ; rm $user.tar " | at now +$scheduled_time minutes	
		fi
	else
		echo "Ο Κατάλογος προορισμού "$destination_dir" δεν υπάρχει."
	fi
fi
