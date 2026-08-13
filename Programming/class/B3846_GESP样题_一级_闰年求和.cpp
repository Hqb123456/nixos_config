#include <bits/stdc++.h>
using namespace std;
int ans;
bool check(int k)
{
    return ((k%400==0)||(k%4==0&&k%100!=0));
}
int main()
{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int a=0,b=0;
    cin>>a>>b;
    for(int i=a+1;i<b;i++){
        if(check(i)){
            ans+=i;
        }else{
            continue;
        }
    }
    cout<<ans<<endl;
    return 0;
}
