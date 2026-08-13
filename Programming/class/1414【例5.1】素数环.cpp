#include <bits/stdc++.h>
using namespace std;
const int MAXN = 30+5;
int a[MAXN],n,r;
bool vis[MAXN];
void dfs(int k)
{
        if(k==r+1){
            for(int i=1;i<=r;i++){
                    printf("%3d",a[i]);
                }
                cout<<endl;
                return;
        }
        for(int i=1;i<=n;i++){
            if(!vis[i] && a[k-1]<i){
                a[k]=i;
                vis[i]=true;
                dfs(k+1);
                vis[i]=false;
            
            }
        }
    }
    

int main()
{
    freopen("1414：【例5.1】素数环.in","r",stdin);
    cin>>n>>r;
    dfs(1);    
    return 0;
}
