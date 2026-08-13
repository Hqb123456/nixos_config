#include <bits/stdc++.h>
using namespace std;
const int MAXN=3e2+5,INF=0x3f3f3f3f;
struct Edge
{
    int v,w;
    Edge(int _v,int _w) : v(_v),w(_w){}
};
bool in_dia[MAXN];
int n,s,fa[MAXN],dis[MAXN],depth[MAXN],max_dis=-1,far_node;
vector<Edge> g[MAXN];
void dfs(int u,int f,int cur_dis)
{
    fa[u]=f;
    dis[u]=cur_dis;
    if(cur_dis>max_dis){
        max_dis=cur_dis;
        far_node=u;
    }
    for(auto& e:g[u]){
        if(e.v!=f){
            dfs(e.v,u,cur_dis+e.w);
        }
    }
}
int get_side(int u,int f,int cur_dis)
{
    int res=cur_dis;
    for(auto&e:g[u]){
        if(e.v==f||in_dia[e.v]){
            continue;
        }
        res=max(res,get_side(e.v,u,cur_dis+e.w));
    }
    return res;
}
int main()
{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    cin>>n>>s;
    for(int i=1;i<=n-1;i++){
        int u,v,w;
        cin>>u>>v>>w;
        g[u].emplace_back(v,w);
        g[v].emplace_back(u,w);
    }
    dfs(1,0,0);
    int start_node=far_node;
    max_dis=-1;
    dfs(start_node,0,0);
    int end_node=far_node;
    vector<int> dia;
    int cur_node=end_node;
    while(cur_node!=0){
        dia.push_back(cur_node);
        cur_node=fa[cur_node];
    }
    reverse(dia.begin(),dia.end());
    for(auto& u : dia){
        in_dia[u]=true;
    }
    int max_side=0;
    for(int& u : dia){
        max_side=max(max_side,get_side(u,0,0));
    }
    int sz=dia.size(),min_ecc=INF;
    for(int i=0;i<sz;i++){
        for(int j=i;j<sz;j++){
            int u=dia[i],v=dia[j];
            int len=dis[v]-dis[u];
            if(len<=s){
                int left=dis[u],right=dis[dia[sz-1]]-dis[v];
                int cur_ecc = max({left,right,max_side});
                min_ecc=min(min_ecc,cur_ecc);
            }
        }
    }
    cout<<min_ecc;
    return 0;
}
