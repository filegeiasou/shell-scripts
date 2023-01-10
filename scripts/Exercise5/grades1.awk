#!/usr/bin/awk -f
BEGIN{
   mo=0
}

{
  sum=0
  for (i = 4 ; i <=7 ; i++)  
  	sum+= $i
  mo=sum/4
  print "Student" ,NR",",$1,$2,mo
}

