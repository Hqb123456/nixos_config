#include <bits/stdc++.h>
using namespace std;
using ll=long long;
const int MAXN=1e2+5;
struct Point
{
    int x,y,z,step;
};
bool m[MAXN][MAXN][MAXN];
int l,r,c,dx[6]={-1,1,0,0,0,0},dy[6]={0,0,-1,1,0,0},dz[6]={0,0,0,0,-1,1};
void bfs(Point s,Point e)
{
    queue<Point>q;
    m[s.x][s.y][s.z]=1;
    s.step=0;
    q.push(s);
    while(!q.empty()){
        Point cur=q.front();
        q.pop();
        if(cur.x==e.x&&cur.y==e.y&&cur.z==e.z){
            printf("Escaped in %d minute(s).\n",cur.step);
            return;
        }
        for(int i=0;i<6;i++){
            int nx=cur.x+dx[i],ny=cur.y+dy[i],nz=cur.z+dz[i];
            if(nx>=1&&nx<=l&&ny>=1&&ny<=r&&nz>=1&&nz<=c){
                if(m[nx][ny][nz]==0){
                    q.push({nx,ny,nz,cur.step+1});
                    m[nx][ny][nz]=1;
                }
            }
        }
    }
    printf("Trapped!\n");
}
int main()
{
    Point s,e;
    while(cin>>l>>r>>c){
        if(l==0&&r==0&&c==0){
            break;
        }
        memset(m,0,sizeof(m));
        for(int i=1;i<=l;i++){
            for(int j=1;j<=r;j++){
                for(int k=1;k<=c;k++){
                    char temp;
                    cin>>temp;
                    switch(temp){
                    case 'S':
                        s.x=i,s.y=j,s.z=k;
                        m[i][j][k]=1;
                        break;
                    case 'E':
                        e.x=i;e.y=j,e.z=k;
                        break;
                    case '#':
                        m[i][j][k]=1;
                        break;
                    }
                }
            }
        }
        bfs(s,e);
    }
    return 0;
}
