#include <bits/stdc++.h>
using namespace std;
const int MAXN=1e5+5;
struct Node{
    int u,dis;
    Node(int u,int dis) : u(u),dis(dis) {}
};
bool vis[MAXN];
int n,d,ans;
vector<int> g[MAXN];
int bfs()
{
    int ans=0;
    queue<Node>q;
    q.emplace(1,0);
    vis[1]=true;
    while(!q.empty()){
        int u=q.front().u,cur_dis=q.front().dis;
        q.pop();
        if(cur_dis>d)continue;
        if(u!=1)ans++;
        for(auto& v:g[u]){
            if(!vis[v]){
                q.emplace(v,cur_dis+1);
                vis[v]=true;
            }
        }
    }
    return ans;
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
    cout<<bfs()<<endl;
    return 0;
}
