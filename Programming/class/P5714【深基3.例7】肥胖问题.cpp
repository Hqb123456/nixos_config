#include <bits/stdc++.h>
using namespace std;

int main()
{
    double m, h, tmp;
    cin >> m >> h;
    tmp = m / (h * h);
    if (tmp < 18.5) cout << "Underweight" << endl;
    else if (tmp >= 18.5 && tmp <= 24) cout << "Normal" << endl;
    else cout << tmp << endl <<"Overweight" << endl;
    return 0;
}
