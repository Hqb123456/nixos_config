#include <bits/stdc++.h>
using namespace std;
const int MAXN=1e5+5;
struct Tree{
    int h;
    bool is_full,is_complete;
};
int l[MAXN],r[MAXN],n,cnt;
Tree dfs(int u)
{
    if(u==0)return{0,true,true};
    Tree left_son=dfs(l[u]),right_son=dfs(r[u]),now;
    now.h=max(left_son.h,right_son.h)+1;
    now.is_full=left_son.is_full&&right_son.is_full&&(left_son.h==right_son.h);
    now.is_complete=false;
    if(left_son.is_full&&right_son.is_complete&&(left_son.h==right_son.h)){
        now.is_complete=true;
    }else if(left_son.is_complete&&right_son.is_full&&(left_son.h==right_son.h+1)){
        now.is_complete=true;
    }
    if(now.is_complete){
        cnt++;
    }
    return now;
}
int main()
{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    cin>>n;
    for(int i=1;i<=n;i++){
        cin>>l[i]>>r[i];
    }
    dfs(1);
    cout<<cnt;
    return 0;
}
