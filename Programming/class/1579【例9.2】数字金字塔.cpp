#include <bits/stdc++.h>
using namespace std;
const int MAXN = 1e3 + 5;
int a[MAXN][MAXN], n;
int dfs(int x, int y) {
  if (x == n) return a[x][y];
  return max(dfs(x + 1, y), dfs(x + 1, y + 1)) + a[x][y];
}
int main() {
  cin >> n;
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= i; j++) {
      cin >> a[i][j];
    }
  }
  cout << dfs(1, 1);
  return 0;
}