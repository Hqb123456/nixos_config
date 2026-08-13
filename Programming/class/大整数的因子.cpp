#include <bits/stdc++.h>
using namespace std;
const int MAXN = 30;
int c[MAXN];
string sc;
void str_to_arr(const string &s,int d[]){
    d[0] = s.size();
    for(int i=1;i<=d[0];i++){
        d[i] = s[d[0]-i]-'0';
    }
}
void div(){
    bool flag = true;
    for(int k=2;k<=9;k++){
        int r=0;
        for(int i=c[0];i>=1;i--){
            int tmp = c[i]+r*10;
            // a[i]=tmp/k;
            r =tmp%k;
        }   
        if(r==0){
            cout<<k<<" ";
            flag=false;
        }
    }
    if(flag){
        cout<<"none"<<"\n";
    }else{
        cout<<"\n";
    }
}
int main(){
    ios::sync_with_stdio(false);
    cin>>sc;
    str_to_arr(sc,c);
    div();
    return 0;
}
