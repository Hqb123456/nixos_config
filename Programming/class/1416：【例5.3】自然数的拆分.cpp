#include <bits/stdc++.h>
using namespace std;
const int MAXN =30+5;
int a[MAXN],n,sum;
void dfs(int k)
{
    if(sum==n){
        cout<<n<<'='<<a[1];
        for(int i=2;i<=k-1;i++){
            cout<<'+'<<a[i];
        }
        cout<<endl;
    }
    if(k>n){
        return;
    }
    for(int i=1;i<=n-1;i++){
        if(a[k-1]<=i){
            a[k]=i;
            sum+=a[k];
            dfs(k+1);
            sum-=a[k];
        }
    }
}
int main()
{
    freopen("1416：【例5.3】自然数的拆分.in","r",stdin);
    cin>>n;
    dfs(1);
    return 0;
}
