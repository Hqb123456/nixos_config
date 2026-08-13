#include <iostream>
using namespace std;
const int MAXN = 3000 + 5;
struct Student{
    int h, w;
} students[MAXN];
int popo_tmp;
void bubble_sort(Student s[], int n){
    for (int i = 0; i <= n; i++){
        for (int j = 0; j < n - i - 1; j++){
            if (s[j].h < s[j + 1].h){
                swap(s[j], s[j + 1]);
                popo_tmp++;
            }
            else if (s[j].h == s[j + 1].h && s[j].w < s[j + 1].w){
                swap(s[j], s[j + 1]);
                popo_tmp++;
            }
            else{
                continue;
            }
        }
    }
}
int main(){
    int n;
    cin >> n;
    for (int i = 0; i < n; i++){
            cin >> students[i].h >> students[i].w;   
    }
    bubble_sort(students, n);
    cout << popo_tmp << "\n";
    return 0;
}
