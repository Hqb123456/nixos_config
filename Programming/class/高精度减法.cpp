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
int compre(){
	int size_a = sa.size(),size_b = sb.size();
	if(size_a<size_b)return -1;
	if(size_a>size_b)return 1;
	for(int i=0;i<size_a;i++){
		if(sa[i]<sb[i]){
			return -1;
		}else if(sa[i]>sb[i]){
			return 1;
		}	
	}
	return 0;
}
void sub(){
	int i;
	for(i = 1;i<=a[0];i++){
		if(a[i]<b[i])a[i+1]--,a[i]+=10;
		c[i]=a[i]-b[i];
	}
	c[0]=i-1;
	while(c[c[0]]==0&&c[0]>1)c[0]--;
}
int main() {
	cin>>sa>>sb;
	if(compre()==-1){
		cout<<'-';
		swap(sa,sb);
	}
	str_to_arr(sa,a);
	str_to_arr(sb,b);
	sub();
	print_arr(c);
	return 0;
}

