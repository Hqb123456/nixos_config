#include <bits/stdc++.h>
using namespace std;
using ll=long long;
const int MAXN=2e3+5,MAXM=1e5+5;
int n,m,dp[MAXM];
int main()
{
    memset(dp,0xcf,sizeof(dp));
    cin>>m>>n;
    dp[0]=0;
    for(int i=1;i<=n;i++){
        int w,p;
        cin>>w>>p;
        for(int j=w;j<=m;j++){
            dp[j]=max(dp[j],dp[j-w]+p);
        }
    }
    int ans=0xcfcfcfcf;
    for(int j=0;j<=m;j++){
        ans=max(ans,dp[j]);
    }
    cout<<ans<<endl;
    return 0;
}
