

#include <stdio.h>
#include <stdlib.h>

#include "../src/include/pbar.h"

int main() {
    struct pbar *progressbar;
    unsigned char i;
    unsigned int wait;

    progressbar = pbarInit(PBAR_TYPE_SLIDE_EQUAL);

    for (i=0;i<34;i++) {
        for (wait=0;wait<1000;wait++);
        pbarRun(3, progressbar);

    }

    pbarEnd(progressbar);
    return 0;
}
