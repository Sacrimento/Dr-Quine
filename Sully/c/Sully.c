#include <stdio.h>
#include <stdlib.h>
#define X 5
int main() {if (X <= 0) {return 1;} char *s = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#define X %4$d%1$cint main() {if (X <= 0) {return 1;} char *s = %2$c%3$s%2$c; char p[4096]; sprintf(p, %2$cSully_%5$cd.c%2$c, X-1); FILE *f = fopen(p, %2$cw%2$c); fprintf(f, s, 10, 34, s, X-1, 37); fclose(f); char c[4096]; sprintf(c, %2$cgcc -Wall -Werror ./Sully_%5$c1$d.c -o ./Sully_%5$c1$d; ./Sully_%5$c1$d%2$c, X-1); system(c);}%1$c"; char p[4096]; sprintf(p, "Sully_%d.c", X-1); FILE *f = fopen(p, "w"); fprintf(f, s, 10, 34, s, X-1, 37); fclose(f); char c[4096]; sprintf(c, "gcc -Wall -Werror ./Sully_%1$d.c -o ./Sully_%1$d; ./Sully_%1$d", X-1); system(c);}
