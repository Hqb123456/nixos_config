#include <bits/stdc++.h>
using namespace std;
const int MAXN=5e4+5;
int n,k,fa[MAXN][20],depth[MAXN],diff[MAXN],ans;
vector<int> g[MAXN];
void dfs1(int u,int f,int dep)
{
    fa[u][0]=f;
    depth[u]=dep;
    for(int&v:g[u]){
        if(v==f) continue;
        dfs1(v,u,dep+1);
    }
}
void dfs2(int u,int f)
{
    for(int&v:g[u]){
        if(v==f)continue;
        dfs2(v,u);
        diff[u]+=diff[v];
    }
    ans=max(ans,diff[u]);
}
void init_lca()
{
    for(int j=1;j<=16;j++){
        for(int i=1;i<=n;i++){
            int mid=fa[i][j-1];
            if(mid==0)    continue;
            fa[i][j]=fa[mid][j-1];
        }
    }
}
int get_lca(int u,int v)
{
    if(depth[u]<depth[v])swap(u,v);
    for(int j=16;j>=0;j--){
        if(depth[fa[u][j]]>=depth[v]){
            u=fa[u][j];
        }
    }
    if(u==v){
        return u;
    }
    for(int j=16;j>=0;j--){
        if(fa[u][j]!=fa[v][j]){
            u=fa[u][j];
            v=fa[v][j];
        }
    }
    return fa[u][0];
}
int main()
{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    cin>>n>>k;
    for(int i=1;i<=n-1;i++){
        int u,v;
        cin>>u>>v;
        g[u].push_back(v);
        g[v].push_back(u);
    }
    dfs1(1,0,1);
    init_lca();
    while(k--){
        int s,t;
        cin>>s>>t;
        int lca=get_lca(s, t);
        diff[s]+=1;
        diff[t]+=1;
        diff[lca]-=1;
        diff[fa[lca][0]]-=1;
    }
    dfs2(1,0);
    cout<<ans;
    return 0;
}
