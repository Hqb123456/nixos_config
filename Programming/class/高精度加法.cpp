#include <bits/stdc++.h>
using namespace std;
const int N = 10005;
int a[N],b[N],c[N];
string sa,sb,sc;
void str_to_arr(const string &s,int d[]) {
	d[0]=s.size();
	for(int i=d[0]; i>=1; i--) {
		d[i]=s[d[0]-i]-'0';
	}
}
void print_arr(int d[]) {
	for(int i=d[0]; i>=1; i--) {
		cout<<d[i];
	}
	cout<<'\n';
}
void add() {
	c[0]=max(a[0],b[0]);
	int x=0,i;
	for(i=1; i<=c[0]; i++) {
		c[i]=a[i]+b[i]+x;
		x=c[i]/10;
		c[i]%=10;
	}
	while(x) {
		c[i]=x%10;
		x/=10;
		i++;
	}
	c[0]=i-1;
	while(c[c[0]]==0&&c[0]>1) {
		c[0]--;
	}
}
int main() {
	cin>>sa>>sb;
	str_to_arr(sa,a);
	str_to_arr(sb,b);
	add();
	print_arr(c);
	return 0;
}

