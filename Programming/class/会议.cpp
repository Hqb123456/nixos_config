#include <bits/stdc++.h>
using namespace std;
const int MAXN=5e5+5;
int N,M,S,depth[MAXN],fa[MAXN][20];
vector<int> g[MAXN];
void dfs(int u,int f,int dep)
{
    fa[u][0]=f;
    depth[u]=dep;
    for(int &v:g[u]){
        if(v==f){
            continue;
        }
        dfs(v,u,dep+1);
    }
}

void init_lca()
{
    for(int j=1;j<=19;j++){
        for(int i=1;i<=N;i++){
            int mid=fa[i][j-1];
            if(mid==0){
                continue;
            }
            fa[i][j]=fa[mid][j-1];
        }
    }
}
int get_lca(int u,int v)
{
    if(depth[u]<depth[v]){
        swap(u,v);
    }
    for(int j=19;j>=0;j--){
        if(depth[fa[u][j]]>=depth[v]){
            u=fa[u][j];
        }
    }
    if(u==v){
        return v;
    }
    for(int j=19;j>=0;j--){
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
    cin>>N>>M>>S;
    for(int i=1;i<=N-1;i++){
        int x,y;
        cin>>x>>y;
        g[x].push_back(y);
        g[y].push_back(x);
    }
    dfs(S,0,1);
    init_lca();
    while(M--){
        int a,b;
        cin>>a>>b;
        cout<<get_lca(a,b)<<'\n';
    }
    return 0;
}
