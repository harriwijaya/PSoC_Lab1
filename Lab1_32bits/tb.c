
#include <stdio.h>

int main(int argc, char **argv)
{
   int a = 8;
   int s;
 
   poly(a, &s);
 
   printf("result is %d", s);
  
   if (s == 209) 
     printf("pass....");
   else 
     printf("fail...%d",s);

   return 0;
}
