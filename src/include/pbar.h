#define PBAR_TYPE_SLIDE_EQUAL 0x01

struct pbar *pbarInit(unsigned char pbartype);
void pbarEnd(struct pbar *ptr);
void pbarRun(unsigned char step, struct pbar *ptr);

struct pbar {
    unsigned char type;
    unsigned char step;
    unsigned char posx;
    unsigned int number_of_values_needed_for_inc_progress_bar; // 16 bits
    unsigned int counter;
    unsigned int inc_value;
    unsigned char current_percentage;
};
