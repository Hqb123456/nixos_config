#include <bits/stdc++.h>
using namespace std;
const int MAXN =10000+5;
int ans[MAXN]={1,1},n;
void mul(){
    int i;
    long long x=0;
    for(i=1;i<=ans[0];i++){
        ans[i]=ans[i]*2+x;
        x=ans[i]/10;
        ans[i]%=10;
    }
    while (x){
        ans[i]=x%10;
        x/=10;
        i++;
    }
    ans[0]=i-1;
    while (ans[0]>1&&ans[ans[0]]==0)ans[0]--;
}
void print_arr(int d[]){
    for(int i=d[0];i>=1;i--){
        cout<<d[i];
    }
    cout <<"\n";
}
int main(){
    ios::sync_with_stdio(false);
    cin>>n;
    for(int i=1;i<=n;i++){
        mul();
    }
    print_arr(ans);
    return 0;
}
