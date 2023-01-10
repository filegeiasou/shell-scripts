#!/usr/bin/awk -f
BEGIN{
   mo=0
   for(i=0;i<4;i++)
   	sum[i]=0
}

{
  for (i = 0 ; i <4 ; i++)  
  	sum[i]+=$(i+4)
}

END{
  for (i=0;i<4;i++)
  	print "Mesos oros sto " i+1 , "mathima einai : " ,sum[i]/NR
}

