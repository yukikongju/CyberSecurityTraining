#include <stdio.h>
#include <stdlib.h>

void unreachableFunction(void) {
    printf("I'm hacked! I am a hidden function");
    exit(0);
}

int main(void) {
    printf("hello world\n");

    return 0;
}
