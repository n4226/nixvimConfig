#include "stdio.h"
#include <cerrno>
#include <cstring>

//a fun func
int add(int a, int b) {
  {
    return a + b;
  }
}

int sub(int a, int b) {
  return a - b;
}

int main() {

  int a = 1;
  int c = add(a, 4);

  int myVar = a;

  printf("Hwllo %d, %d",a,c);


  printf("Hello");

  printf("Hello\n");


  return 0;
}
