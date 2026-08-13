#include <bits/stdc++.h>
using namespace std;
const int MAXN =10000+5;
int m[MAXN],rev[MAXN],n;
string sm;
void string_to_array(const string &s,int d[]){
    d[0]=s.size();
    for(int i=d[0];i>=1;i--){
        int j=d[0]-i;
        if(isdigit(s[i])){
            d[i]=s[j]-'0';
        } else if(isupper(s[i])){
            d[i]=s[j]-'A'+10;
        }else{
            d[i]=s[j]-'a'+10;
        }
    }
}
void reverse(){
    rev[0]=m[0];
    for(int i=m[0];i>=1;i--){
        rev[i]=m[m[0]-i+1];
    }
}
bool judge(){
    for(int i=m[0],j=1;j<i;i--,j++){
        if(m[i]!=m[j]){
            return false;
        }
    }
    return true;
}
void add(){
    int x=0,i;
    for(i=1;i<=m[0];i++){
        m[i]=m[i]+rev[i]+x;
        x=m[i]/n;
        m[i]%=n;
    }
    while(x){
        m[i]=x%n;
        x/=n;
        i++;
    }
    m[0]=i-1;
    while(m[0]>1&&m[m[0]]==0){
        m[0]--;
    }
}
void print_arr(int d[]){
    for(int i=d[0];i>=1;i--){
        cout<<d[i];
    }
    cout <<"\n";
}
int main(){
    ios::sync_with_stdio(false);
    cin>>n>>sm;
    string_to_array(sm,m);
    reverse();
    if(judge()){
        cout<<'0';
    }else{
        for(int i=1;i<=30;i++){
            add();
            if(judge()){
                cout<<i;
                return 0;
            }
                reverse();
        }
        cout<<"Impossible\n";
    }
    return 0;
}
