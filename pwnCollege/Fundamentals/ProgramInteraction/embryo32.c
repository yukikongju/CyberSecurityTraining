#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

void pwncollege() {
  int pid;
  if ((pid = fork())) {
    wait(NULL);
  } else {
    execl("/challenge/embryoio_level32", "Level", NULL);
  }
}

int main() {
  pwncollege();
  return 0;
}
