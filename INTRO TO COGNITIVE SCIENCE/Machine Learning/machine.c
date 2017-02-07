#include <stdio.h>
FILE *feng;
FILE *fnep;
	
int main()
{
	char engArr[100],nepArr[100];
	int i=0	;
	feng = fopen("eng.txt","r");
	char engch;
	while( ( engch = fgetc(feng) ) != EOF )
	{
		printf("%c",engch);
		engArr[i] = engch;
		i++;
	}
	fclose(feng);
	
	
	printf("\n\n\n");
	fnep = fopen("nep.txt","r");
	char nepch;
	while( ( nepch = fgetc(fnep) ) != EOF )
	{
		printf("%c",nepch);
		nepArr[i] = nepch;
		i++;
	}
	fclose(fnep);
	
	return 0;
}
