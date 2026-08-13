#include <bits/stdc++.h>
using namespace std;
const int MAXN=1e2+5,MAXM=2e4+5,INF=0xcfcfcfcf;
long long n,m,dp[MAXN][MAXM];
int main()
{
    memset(dp,0xcf,sizeof(dp));
    cin>>m>>n;
    dp[0][0]=0;
    for(int i=1;i<=n;i++){
        int w,p;
        cin>>w>>p;
        for(int j=0;j<=m;j++){
            if(j>=w){
                dp[i][j]=max(dp[i-1][j],dp[i-1][j-w]+p);
            }else{
                dp[i][j]=dp[i-1][j];
            }
        }
    }
    long long ans=INF;
    for(int j=0;j<=m;j++){
        ans=max(ans,dp[n][j]);
    }
    cout<<ans<<endl;
    return 0;
}
