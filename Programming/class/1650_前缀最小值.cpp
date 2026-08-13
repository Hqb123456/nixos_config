#include <bits/stdc++.h>
using namespace std;
using ll = long long;
const int MAXN=1e5+5;
int a[MAXN],dp[MAXN],n,x;
ll sum;
int main()
{
    cin>>n>>x;
    a[1]=x;
    for(int i=2;i<=n;i++){
        a[i]=(379*a[i-1]+131)%997;
    }
    dp[1]=a[1];
    sum=dp[1];
    for(int i=2;i<=n;i++){
        dp[i]=min(dp[i-1],a[i]);
        sum+=dp[i];
    }
    cout<<sum;
    return 0;
}
