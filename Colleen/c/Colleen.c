#include <stdio.h>
/*
	42
*/

void print(char *s)
{
	printf(s, 10, 9, 34, s);
}

int main()
{
	/*
		Another one
	*/

	char *str = "#include <stdio.h>%1$c/*%1$c%2$c42%1$c*/%1$c%1$cvoid print(char *s)%1$c{%1$c%2$cprintf(s, 10, 9, 34, s);%1$c}%1$c%1$cint main()%1$c{%1$c%2$c/*%1$c%2$c%2$cAnother one%1$c%2$c*/%1$c%1$c%2$cchar *str = %3$c%4$s%3$c;%1$c%2$cprint(str);%1$c%2$creturn (0);%1$c}%1$c";
	print(str);
	return (0);
}
