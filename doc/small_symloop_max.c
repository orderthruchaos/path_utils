#include <stdio.h>
#include <limits.h>
#include <sys/param.h>
int main(void) {
    unsigned int symloop_max = 64;
#ifdef SYMLOOP_MAX
    symloop_max = SYMLOOP_MAX;
#elif defined(MAXSYMLINKS)
    symloop_max = MAXSYMLINKS;
#endif
    printf("%u\n", symloop_max); return 0;
}
