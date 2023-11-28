#include <iostream>
#include "submission.hpp"
using namespace std;

int main() {
    int K;
    int a;
    int b;

    cin >> K;

    for (int i=0; i < K; i++) {
        cin >> a;
        cin >> b;
        cout << sum_of_two(a,b) << endl;
    }

    return 0;
}
