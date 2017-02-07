#include <iostream>
#include <string.h>
#define MAX 100
using namespace std;
class Check
{
	private:
		char email[MAX];
		char userID[MAX-50];
		char domain[MAX-50];
		char others[MAX-50];
		bool flag1,flag2;
	public:
		Check()
		{
			strcpy(email,"");
			strcpy(domain,"");
			strcpy(userID,"");
			strcpy(others,"");
			flag1 = flag2 = false;
		}
		void input()
		{
			cout<<"Enter the email ID\n";
			cin>>email;
		}
		void seperateUserIDandDomain()
		{
			int i = 0,j=0,k=0,l =0,m=0;
			do{
				userID[i] = email[i];
				i++;
			}while( email[i] != '@');
			
			j = i-1;
			while(email[j] != '.')
			{
				domain[k] = email[j+1];
				k++;j++;
			}
			l = j;
			while(email[l] != '\n')
			{
				others[m] = email[l+1];
				l++;m++;
			}
			if ( domain[0] == '@' && domain[1] == 'g' && domain[2] == 'm' && domain[3] == 'a' &&
			domain[4] == 'i' && domain[5] == 'l' && domain[6] == '.' ) 
			{
				//cout<<"***domain OK***"<<endl;
				flag1 = true;
			}
			else
			{
				//cout<<"###Problem in domain###"<<endl;
				flag1 = false;
			}
			if(others[0] == 'c' && others[1] == 'o' && others[2] == 'm')
			{
				//cout<<"***others OK***"<<endl;
				flag2 = true;
			}
			else
			{
				//cout<<"###Problem in others###"<<endl;
				flag2 = false;
			}
		}
		bool checkFlag()
		{
			if(flag1 && flag2 == true)
			{
				//cout<<"%%%Email Valid%%%"<<endl;
				return true;
			}
			else
			{
				//cout<<"$$$Email not valid$$$"<<endl;
				return false;
			}
		}
		bool checkUserID()
		{
			bool flag;
			int x = strlen(userID);
			for(int i = 0;i<x;i++)
			{
				if(userID[i] == '*' || userID[i] == '#' || userID[i] == '$' || userID[i] == '%' || 
					userID[i] == '^' || userID[i] == '&' || userID[i] == '~' || userID[i] == '?' ||
					userID[i] == '<' || userID[i] == '>' || userID[i] == ':' || userID[i] == ';' )
				{
					flag = false;
				}
				else
				{
					flag = true;
				}
			}
			return flag;
		}
		void Display()
		{
			cout<<"Email ID = "<<email<<endl;
			cout<<"User ID = "<<userID<<endl;
			cout<<"Domain = "<<domain<<endl;
			cout<<"Others = "<<others<<endl;
		}
};
int main()
{
	Check e1;
	e1.input();
	e1.seperateUserIDandDomain();
	//e1.checkUserID();
	//e1.checkFlag();
	if (e1.checkFlag() && e1.checkUserID() == true)
	{
		cout<<"VALID GMAIL ID"<<endl;
	}
	else
	{
		cout<<"NOT VALID GMAIL ID"<<endl;
	}
	//e1.Display();
return 0;
}
