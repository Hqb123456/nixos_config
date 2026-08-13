#include <stdio.h>

int main()
{
    int x;
    scanf("%d",&x);
    printf("Today, I ate %d apple",x);
    if(x==0||x==1){
        printf(".");
    }else{
        printf("s.");
    }
    return 0;
}
