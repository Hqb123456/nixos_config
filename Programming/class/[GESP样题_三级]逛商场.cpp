#include <iostream>
using namespace std;
int MAXN=1e2+5;  

int main (int argc, char *argv[]) 
{
    int n,a[MAXN],money,ans=0;
    cin>>n;
    for(int i=0;i<n;i++){
        cin>>a[i];
    }
    cin>>money;
    for(int i=0;i<n;i++){
        if(money>=a[i]){
            money-=a[i];
            ans++;
        }else {
            continue;
        }
    }
    cout<<ans;
    return 0;
}
