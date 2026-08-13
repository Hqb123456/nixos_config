#include <iostream>
#include <string>
using namespace std;
const int MAXN =10000 + 5;
int a[MAXN],b[MAXN],c[MAXN],temp[MAXN];
string sa, sb;
int cmpare(int d[]){
    if(a[0]>d[0]){
        return 1;
    }
    if(a[0]<d[0]){
        return -1;
    }
    for(int i = a[0];i>=1;i--){
        if(a[i]>d[i]){
            return 1;
        }
        if(a[i]<d[i]){
            return -1;
        }
    }
    return 0;
}
void left_shift(int x){
    fill(temp,temp+MAXN,0);
    for(int i =1;i<=b[0];i++){
        temp[0]=b[0]+ x ;
    }
}
void sub(){
    for(int i =1;i<=a[0];i++){
        if(a[i]<temp[i]){
            a[i+1]--;
            a[i]+=10;
        }
        a[i]-=temp[i];
    }
}
void div(){
    int res = cmpare(b);
    if(res==-1){
        c[0]=1,c[1]=0;
    }else if(res==0){
        c[0]=1,c[1]=1;
    }else{
        c[0]=a[0]-b[0]+1;
        for(int i=c[0];i>=1;i--){
            left_shift(i-1);
            while(cmpare(temp)>=0){
                sub();
                c[i]++;
            }
        }
        while (c[0]>1 && c[c[0]]==0){
            c[0]--;
        }
    }
}
void str_to_arr(const string &s,int d[]){
	d[0]=s.size();
	for(int i = d[0];i>=1;i--){
		d[i]=s[d[0]-i]-'0';
	}
}
void print_arr(int d[]){
	for(int i = d[0];i>=1;i--){
		cout<<d[i];
	}
    cout <<'\n';
}

int main(){
    cin>>sa>>sb;
    str_to_arr(sa,a);
    str_to_arr(sb,b);
    div();
    print_arr(c);
    return 0;
}
