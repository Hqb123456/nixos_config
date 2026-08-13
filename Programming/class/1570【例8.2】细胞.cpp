#include <bits/stdc++.h>
using namespace std;
const int MAXN=1e3+5,MAXM=1e3+5;
int a[MAXN][MAXM],n,m,dx[4]={-1,1,0,0},dy[4]={0,0,-1,1};
struct Cell{
    int x,y;
};
void bfs(int x,int y){
    queue<Cell> q;
    q.push({x,y});
    a[x][y]=0;
    while(!q.empty()){
	int cur_x=q.front().x;
	int cur_y=q.front().y;
	q.pop();
	for(int i=0;i<4;i++){
	    int nx=cur_x+dx[i],ny=cur_y+dy[i];
	    if(a[nx][ny]==1){
		q.push({nx,ny});
		a[nx][ny]=0;
	    }
	}
    }
}
int main(){
    cin>>n>>m;
    for(int i=1;i<=n;i++){
        for(int j=1;j<=m;j++){
            char tmp;
            cin>>tmp;
            a[i][j]=(tmp=='0' ? 0 : 1 );
        }
    }
    int cnt=0;
    for(int i=1;i<=n;i++){
        for(int j=1;j<=m;j++){
            if(a[i][j]==1){
                cnt++;
                bfs(i,j);
            }
        }
    }
    
    cout<<cnt<<endl;
    return 0;
}
