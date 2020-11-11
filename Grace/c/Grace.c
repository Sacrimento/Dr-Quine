#include <stdio.h>

/*
	42
*/

#define def
#define ine
#define main int main() {FILE *f = fopen("Grace_kid.c", "w"); if (!f) {return 1;} char *s = "#include <stdio.h>%1$c%1$c/*%1$c%2$c42%1$c*/%1$c%1$c#define def%1$c#define ine%1$c#define main int main() {FILE *f = fopen(%3$cGrace_kid.c%3$c, %3$cw%3$c); if (!f) {return 1;} char *s = %3$c%4$s%3$c; fprintf(f, s, 10, 9, 34, s); fclose(f);}%1$cmain%1$c"; fprintf(f, s, 10, 9, 34, s); fclose(f);}
main
