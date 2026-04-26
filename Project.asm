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
void runFloatBenchmark() {
    auto start = now();
    volatile double a = 10.5, b = 20.5, res = 0.0;

    for (long long i = 0; i < 10000000000LL; ++i) res = a + b;
    for (long long i = 0; i < 5000000000LL; ++i) res = a * b;
    for (long long i = 0; i < 2000000000LL; ++i) res = b / a;

    auto end = now();
    chrono::duration<double> diff = end - start;
    cout << "Float Benchmark: " << diff.count() << " seconds" << endl;
}
void runMemoryBenchmark() {
    auto start = now();
    const size_t SIZE = 125000000; // 500MB (125M * 4 bytes)
    vector<int32_t> arr(SIZE, 1);
    volatile int32_t sink = 0;

    for (int iter = 0; iter < 10; ++iter) {
        // Read Phase
        for (size_t i = 0; i < SIZE; ++i) sink = arr[i];
        // Write Phase
        for (size_t i = 0; i < SIZE; ++i) arr[i] = sink;
    }

    auto end = now();
    chrono::duration<double> diff = end - start;
    cout << "Memory Benchmark: " << diff.count() << " seconds" << endl;
}
