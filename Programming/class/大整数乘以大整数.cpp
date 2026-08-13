#include <iostream>
using namespace std;
const int MAXN =10000 +5;
int a[MAXN],b[MAXN],c[MAXN * 2];
string sa,sb;
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
  cout<<'\n';
}
void mul(){

  for(int i=1;i<=b[0];i++){
    int x = 0,j;
    for(j=1;j<=a[0];j++){
      c[i+j-1]+=b[i]*a[j]+x;
      x=c[i+j-1]/10;
      c[i+j-1]%=10;
    }
    while(x){
      c[i+j-1]=x%10;
      x/=10;
      j++;
    }
  }
  c[0]=a[0]+b[0];
  while(c[c[0]]==0&&c[0]>1){
    c[0]--;
  }
}
int main(){
  cin>>sa>>sb;
  str_to_arr(sa,a);
  str_to_arr(sb,b);
  mul();
  print_arr(c);
  return 0;
}

