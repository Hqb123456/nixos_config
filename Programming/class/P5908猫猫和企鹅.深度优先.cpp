#include <bits/stdc++.h>
using namespace std;
const int MAXN=1e5+5;
int n,d,ans;
vector<int> g[MAXN];
void dfs(int u,int f,int depth)
{
    if(depth>d)return;
    if(u!=1)ans++;
    for(auto& v : g[u]){
        if(v!=f){
            dfs(v,u,depth+1);
        }
    }
}
int main()
{
    cin>>n>>d;
    for(int i=1;i<=n-1;i++){
        int u,v;
        cin>>u>>v;
        g[u].push_back(v);
        g[v].push_back(u);
    }
    dfs(1,0,0);
    cout<<ans<<endl;
    return 0;
}
