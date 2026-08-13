#include <bits/stdc++.h>
using namespace std;
const int MAXN=1e3+5;
int n[MAXN];
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int p,d;
    cin>>p>>d;
    for(int i=1;i<=d;i++){
        int tmp;
        cin>>tmp;
        n[tmp]+=i;
    }
    for(int i=0;i<p;i++){
        cout<<n[i]<<' ';
    }
    return 0;
}
