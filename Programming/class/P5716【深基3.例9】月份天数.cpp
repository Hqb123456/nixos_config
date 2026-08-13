#include <bits/stdc++.h>
using namespace std;
bool check(int mouth)
{
    if(mouth %400==0||mouth%4==0&&mouth%100!=0)
        return true;
    return false;
}
int main()
{
    int year,mouth;
    cin>>year>>mouth;
    if(check(year)&&mouth ==2){
        cout<<"29";
    }else if(!check(year)&&mouth==2){
        cout<<"28";
    }else if(mouth == 4 || mouth == 6 || mouth == 9 || mouth == 11){
        cout<<"30";
    }else{
        cout<<"31";
    }
    return 0;
}
