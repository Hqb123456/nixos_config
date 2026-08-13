#include <iostream>
using namespace std;

int main()
{
    int n,p1,p2;
    cin>>n;
    p1=n*5,p2=11+3*n;
    if(p1<p2){
        cout<<"Local";
    }else{
        cout<<"Luogu";
    }
    return 0;
}
