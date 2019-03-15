%{

#include <stdio.h>
#include <string.h>

int i=0, j=0, k=0;
%}

USERNAME [A-Za-z0-9]+
%%


{USERNAME}\@([a-z]+[.])?fee[.]unicamp[.]br {
i++;
}

{USERNAME}\@([a-z]+[.])?unicamp[.]br {
j++;
}


{USERNAME}\@{USERNAME}([.][a-z]+)* {
k++;
}

[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;


%%

int main() {
  yylex();

  printf("%d %d %d\n", k+j+i, j+i, i);//print total, unicamp, fee
  return 0;
}
