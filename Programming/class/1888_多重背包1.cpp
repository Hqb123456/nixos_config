#include <bits/stdc++.h>
using namespace std;
const int MAXN=1e3+5,MAXM=1e3+5;
int dp[MAXN][MAXM],n,m;
int main()
{
    memset(dp,0xcf,sizeof(dp));
    cin>>n>>m;
    dp[0][0]=0;
    for(int i=1;i<=n;i++){
        int v,w,s;
        cin>>v>>w>>s;
        for(int j=0;j<=m;j++){
            for(int k=0;k<=s;k++){
                dp[i][j]=max(dp[i][j],dp[i-1][j]); 
                if(j>=k*v){
                    dp[i][j]=max(dp[i][j],(dp[i-1][j-k*v]+k*w));
                }
            }
        }
    }
    int ans=0xcfcfcfcf;
    for(int j=0;j<=m;j++){
        ans=max(ans,dp[n][j]);
    }
    cout<<ans<<endl;
    return 0;
}
