#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
const int MAXN = 1000000+5;
int n,a[MAXN]={1,1};
void mul(int b){
    ll x=0;
    int i;
    for(i=1;i<=a[0];i++){
        ll tmp = static_cast<ll>(a[i])*b+x;
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
void print_arr(int d[]){
    for(int i=d[0];i>=1;i--){
        cout<<d[i];
    }
}
int main(){
    cin>>n;
    for(int i=1;i<=n;i++){
        mul(i);
    }
    print_arr(a);
    return 0;
}
