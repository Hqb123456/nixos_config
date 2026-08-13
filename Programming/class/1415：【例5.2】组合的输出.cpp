#include <bits/stdc++.h>
using namespace std;
const int MAXN = 30+5;
int a[MAXN],r,n;
bool vis[MAXN],is_complete=false;
bool judge_prime(int x,int y){
    int z=x+y;
    if(z<=1){
        return false;
    }
    for(int i=2 ;i<=sqrt(z);i++){
        if(z%i==0){
            return false;
        }
    }
    return true;
}
void dfs(int k)
{
    if(!is_complete){
        if(k==r+1){
            if(judge_prime(a[1],a[n])){
                for(int i=1;i<=n;i++){
                    printf("%3d",a[i]);
                }
                cout<<endl;
                return;
            }
        }
        for(int i=1;i<=n;i++){
            if(!vis[i] && a[k-i]<i){
                a[k]=i;
                vis[i]=true;
                dfs(k+1);
                vis[i]=false;
            
            }
        }
    }
    
}
int main()
{
    freopen("a.in","r",stdin);
    cin>>n>>r;
    dfs(1);
    return 0;
}
