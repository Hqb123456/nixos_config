#include <bits/stdc++.h>
using namespace std;

int main()
{
    int n,m,a[1000+5]={0};
    cin>>n>>m;
    for(int i=0;i<m;i++){
        int tmp;
        cin>>tmp;
        a[tmp]=1;
    }
    int ans=0;
    for(int i=0;i<n;i++){
        if(a[i]==0){
            ans++;
            cout<<i<<' ';
        }
    }
    if(ans==0){
        cout<<n;
    }
    return 0;
}
