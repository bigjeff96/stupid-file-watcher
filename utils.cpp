#include "utils.h"

void hello_there(int i = 0) {
    if (i)
        printf("Hello there! with %d\n", i);
    else
        printf("Hello there!\n");
}
