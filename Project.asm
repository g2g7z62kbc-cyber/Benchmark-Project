#include <iostream>
#include <vector>
#include <chrono>
#include <fstream>
#include <string>
#include <cmath>

using namespace std;

// High-precision timer helper
auto now() { return chrono::high_resolution_clock::now(); }
void runIntegerBenchmark() {
    auto start = now();
    volatile int a = 10, b = 20, res = 0;

    // 10^10 additions
    for (long long i = 0; i < 10000000000LL; ++i) res = a + b;
    // 5 * 10^9 multiplications
    for (long long i = 0; i < 5000000000LL; ++i) res = a * b;
    // 2 * 10^9 divisions
    for (long long i = 0; i < 2000000000LL; ++i) res = b / a;

    auto end = now();
    chrono::duration<double> diff = end - start;
    cout << "Integer Benchmark: " << diff.count() << " seconds" << endl;
}
