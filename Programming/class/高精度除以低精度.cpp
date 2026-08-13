#include <iostream>
#include <string>
using namespace std;
const int MAXN = 10000 + 5;
int a[MAXN],b,c[MAXN],r;
string sa;
void str_to_arr(const string &s,int d[]){
	d[0]=s.size();
	for(int i = d[0];i>=1;i--){
		d[i]=s[d[0]-i]-'0';
	}
}
void print_arr(int d[]){
	for(int i = d[0];i>=1;i--){
		cout<<d[i];
	}
}
void div(){
	for(int i=a[0];i>=1;i--){
		int temp = a[i] + r * 10;
		c[i] = temp / b;
		r = temp % b;
	}
	c[0]=a[0];
	while (c[0]>1&&c[c[0]]==0){
		c[0]--;
	}
}
int main(){
	cin>>sa>>b;
	str_to_arr(sa,a);
	div();
	print_arr(c);
	cout<<'\n'<<r;
	return 0;
}

