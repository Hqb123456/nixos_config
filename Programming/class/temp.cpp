#include <bits/stdc++.h>
using namespace std;
const int MAXN = 1e3 + 5;
int a[MAXN][MAXN], n,dp[MAXN][MAXN];

int main() 
{
	cin >> n;
  	for (int i = 1; i <= n; i++) {
    	for (int j = 1; j <= i; j++) {
      		cin >> a[i][j];
    	}
  	}
	dp[1][1]=a[1][1];
	for (int i = 1; i <= n; i++) {
    	for (int j = 1; j <= i; j++) {
      		dp[i][j]=max(dp[i-1][j-1],dp[i-1][j])+a[i][j];
    	}
  	}
  	int ans=0;
  	for(int j=1;j<=n;j++){
  		ans=max(ans,dp[n][j]);
  	}
  	cout<<ans<<endl;
  	return 0;
}