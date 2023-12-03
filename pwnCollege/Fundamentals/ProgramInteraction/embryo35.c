#include <fcntl.h>
#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

void pwncollege() {
  int fd;
  if (fork()) {
    wait(NULL);
  } else {
    const char *envp[] = {NULL};
    execle("/challenge/embryoio_level35", "Level", NULL, envp);
  }
}

int main() {
  pwncollege();
  return 0;
}
