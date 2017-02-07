#include <stdio.h>
#define MAX 100
int main()
{
	char email[9];
	scanf("%s",email);
	int i = 0;
	while(email[i] != '\n')
	{
		printf("%c %d||",email[i],i);
		i++;
	}
	//char userID[MAX-50];
	//char domain[MAX-50]; 
	//int i = 0,k = 0,j = 0;
	//printf("Enter email id:\n");
	//scanf("%s",email);
	
	//int i = 0,j=0,k=0,l =0,m=0;
			//do{
				//userID[i] = email[i];
				//i++;
			//}while( email[i] != '@');
			
			//j = i-1;
			//cout<<"j = "<<j;
			//while(email[j] != '.')
			//{
				//domain[k] = email[j+1];
				//k++;j++;
			//}
			//l = k;
			//while(email[k] != '\n')
			//{
				//others[m] = email[k];
				//k++;m++;
			//}
	//printf("%s",email);
	//printf(
	//domain[0] = 'g';
	//domain[1] = 'm';
	//domain[2] = 'a';
	//domain[3] = 'i';
	//domain[4] = 'l';
	
	//while(email[j] != '.');
	//{
		//domain[k] = email[j];
		//k++;
		//j++;
	//}
	
	//printf("%s\n",domain);
	return 0;
}

