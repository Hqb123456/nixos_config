#include <bits/stdc++.h>
using namespace std;
const int MAX = 10000 +5;
long long a[MAX],b,c[MAX];
string sa;
void str_to_arr(const string &s,long long d[]) {
  d[0]=s.size();
  for(int i = d[0]; i>=1; i--) {
    d[i]=s[d[0]-i]-'0';
  }
}
void print_arr(long long d[]) {
  for(int i =d[0]; i>=1; i--) {
    cout<<d[i];
  }
  cout<<endl;
}
void mul() {
  int i;
  long long x = 0;
  for(i=1; i<=a[0]; i++) {
    c[i]=a[i]*b+x;
    x=c[i]/10;
    c[i]=c[i]%10;
  }
  while(x) {
    c[i]=x%10;
    x/=10;
    i++;
  }
  c[0]= i-1;
  while(c[c[0]]==0&&c[0]>1) {
    c[0]--;
  }
}
int main() {
  cin>>sa>>b;
  str_to_arr(sa,a);
  mul();
  print_arr(c);
  return 0;
}
