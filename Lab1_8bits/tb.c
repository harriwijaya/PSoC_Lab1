
#include <stdio.h>

int main(int argc, char **argv)
{
   char a = 3;
   char s;
 
   poly(a, &s);
 
   printf("result is %d", s);
  
   if (s == 34) 
     printf("pass....");
   else 
     printf("fail...%d",s);

   return 0;
}
