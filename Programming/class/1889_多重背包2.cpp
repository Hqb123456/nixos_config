#include <bits/stdc++.h>
using namespace std;
const int MAXM=2e3+5;
int dp[MAXM],n,m;
int main()
{
    memset(dp,0xcf,sizeof(dp));
    cin>>n>>m;
    dp[0]=0;
    for(int i=1;i<=n;i++){
        int v,w,s,k=1;
        cin>>v>>w>>s;
        while(k<=s){
            for(int j=m;j>=k*v;j--){
                dp[j]=max(dp[j],dp[j-k*v]+k*w);
            }
            s-=k;
            k<<=1;
        }
        if(s>0){
            for(int j=m;j>=s*v;j--){
                dp[j]=max(dp[j],dp[j-s*v]+s*w);
            }
        }        
    }
    int ans=0xcfcfcfcf;
    for(int j=0;j<=m;j++){
        ans=max(ans,dp[j]);
    }
    cout<<ans<<endl;
    return 0;
}
