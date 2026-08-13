#include <bits/stdc++.h>
using namespace std;

int main() {
    int N,b;
    cin>>N>>b;
    if(N==0){
        cout<<0<<endl;
        return 0;
    }
    string result = "";
    while(N>0){
        int re=N%b;
        char digit;
        if (re>=10)
            digit='A'+(re-10);
        else
            digit='0'+re;
        result=digit+result;
        N/=b;
    }
    cout<<result<<endl;
    return 0;
}
