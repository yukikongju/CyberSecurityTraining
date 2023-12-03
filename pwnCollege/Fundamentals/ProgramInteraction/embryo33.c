#include <fcntl.h>
#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

void pwncollege() {
  int fd;
  fd = open("/tmp/twoxyz", O_RDONLY);
  if (fork()) {
    wait(NULL);
  } else {
    dup2(fd, 0); // read fd file as stdin
    execl("/challenge/embryoio_level33", "Level", NULL);
  }
}

int main() {
  pwncollege();
  return 0;
}
