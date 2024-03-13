#include <poll.h>

#include <cstdio>
#include <cstdlib>

// Headers
#include "utils.h"

// C++ files
#include "utils.cpp"

int main() {
    for (int i = 0; i < 20; i++) {
        hello_there(i);
    }
}
