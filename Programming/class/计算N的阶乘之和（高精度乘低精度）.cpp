#include <bits/stdc++.h>
using namespace std;
const int MAXN = 1e5 + 5;
typedef long long ll;
int a[MAXN]={1,1},s[MAXN]={1,0},n;
void mul(int b){
    ll x=0;
    int i;
    for(i=1;i<=a[0];i++){
        ll tmp=static_cast<ll>(a[i])*b+x;
        x=tmp/10;
        a[i]=tmp%10;
    }
    while(x){
        a[i]=x%10;
        x/=10;
        i++;
    }
    a[0]=i-1;
    while(a[0]>1&&a[a[0]]==0){
        a[0]--;
    }
}
void add(){
    int i,x=0;
    for(i=1;i<=max(a[0],s[0]);i++){
        s[i]=a[i]+s[i]+x;
        x=s[i]/10;
        s[i]%=10;
    }
    while(x){
        s[i]=x%10;
        x/=10;
        i++;
    }
    s[0]=i-1;
    while(s[0]>1&&s[s[0]]==0){
        s[0]--;
    }
}
void print_arr(int d[]){
    for(int i=d[0];i>=1;i--){
        cout<<d[i];
    }
    cout<<"\n";
}
int main(){
    cin>>n;
    for(int i=1;i<=n;i++){
        mul(i);
        add();
    }
    print_arr(s);
    return 0;
}
