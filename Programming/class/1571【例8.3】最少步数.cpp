#include <bits/stdc++.h>
using namespace std;
const int MAXN = 105, MAXM = 105;
bool vis[MAXN][MAXM];
int dx[12] = {-1, -2, -2, -2, -2, -1, 1, 2, 2, 2, 2, 1};
int dy[12] = {2, 2, 1, -1, -2, -2, -2, -2, -1, 1, 2, 2};

struct Point {
    int x, y, step;
};

int bfs(int sx, int sy) {
    memset(vis, 0, sizeof(vis));
    queue<Point> q;
    q.push({sx, sy, 0});
    vis[sx][sy] = true;
    while (!q.empty()) {
        Point cur = q.front();
        q.pop();
        if (cur.x == 1 && cur.y == 1) {
            return cur.step;
        }
        for (int i = 0; i < 12; i++) {
            int nx = cur.x + dx[i];
            int ny = cur.y + dy[i];
            if (nx >= 1 && nx <= 100 && ny >= 1 && ny <= 100 && !vis[nx][ny]) {
                q.push({nx, ny, cur.step + 1});
                vis[nx][ny] = true;
            }
        }
    }
    return -1;
}

int main() {
    int ax, ay, bx, by;
    while (cin >> ax >> ay) {
        cin >> bx >> by;
        cout << bfs(ax, ay) << endl;
        cout << bfs(bx, by) << endl;
    }
    return 0;
}
