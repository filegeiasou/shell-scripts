#!/bin/bash

# Έλεγχος για το συνολικό αριθμό των όρισμάτων
if [ $# -lt 3 ]
then
  echo "Χρησιμοποιήστε το script με την παρακάτω μορφή:"
  echo "bck user source_directory destination_directory "
else
user=$1
source_dir=$2
destination_dir=$3
if id "$user" >/dev/null 2>&1
then
# Έλεγχος για την ύπαρξη του καταλόγου προέλευσης
if [ -d "$source_dir" ] || [ -f "$source_dir" ]
then
# Έλεγχος για την ύπαρξη του καταλόγου προορισμού
if [ -d "$destination_dir" ] || [ -f "$destination_dir" ]
then
# Δημιουργία αντίγραφου με τη χρήση της εντολής "tar"
tar -cf "$user.tar" "$source_dir"		
    # Αντιγραφή του αντίγραφου στον κατάλογο προορισμού
    if [ -d "$destination_dir" ]
    then
      cp "$user.tar" "$destination_dir"
    else
      # Αν το όρισμα είναι αρχείο, τότε προσθέτει το αντίγραφο
      cat "$user.tar" >> "$destination_dir"
    fi

    # Διαγραφή του αντίγραφου
    rm "$user.tar"
  else
    echo "Ο Κατάλογος προορισμού "$destination_dir" δεν υπάρχει."
fi
else
echo "Ο κατάλογος προέλευσης "$source_dir" δεν υπάρχει."
fi
else
echo "Ο χρήστης "$user" δεν υπάρχει."
fi
fi

