#include <fcntl.h>
#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

void pwncollege() {
  int fd;
  if (fork()) {
    wait(NULL);
  } else {
    execl("/challenge/embryoio_level34", "Level", NULL);
  }
}

int main() {
  pwncollege();
  return 0;
}

// ~/a.out > /tmp/csuwtc
