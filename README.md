# Simple lib for a progress bar

![](img/pbar_execute.png)

example folder contains a pbar.c example program

## informations for C

This returns a pbar ptr struct (a malloc to the Orix kernel), arg is the type of the pbar, for instance one pbar type is available

 * struct pbar *pbarInit(unsigned char pbartype);

pbarRun display the next percentage and the next char for the progressbar. Each type the pbarRun is called, the bar add "3%" to the current percentage.
Step arg is not used yet. pbarRun must be called 34 times to have almost the complete bar. pbarEnd will displays 100%  and will free pbar struct.

* void pbarRun(unsigned char step, struct pbar *ptr);

pbarEnd finishes the bar and free the pbar ptr

* void pbarEnd(struct pbar *ptr);*

