#include <bits/stdc++.h>
using namespace std;
const int MAXN=1e2+5,MAXM=2e4+5,INF=0xcfcfcfcf;
long long n,m,dp[MAXM];
int main()
{
    memset(dp,0xcf,sizeof(dp));
    cin>>m>>n;
    dp[0]=0;
    for(int i=1;i<=n;i++){
        int w,p;
        cin>>w>>p;
        for(int j=m;j>=w;j--){
            dp[j]=max(dp[j],dp[j-w]+p);
        }
    }
    long long ans=INF;
    for(int j=0;j<=m;j++){
        ans=max(ans,dp[j]);
    }
    cout<<ans<<endl;
    return 0;
}
