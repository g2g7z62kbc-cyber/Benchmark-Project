#include <iostream>
#include <vector>
#include <chrono>
#include <fstream>
#include <string>
#include <cmath>

using namespace std;

// High-precision timer helper
auto now() { return chrono::high_resolution_clock::now(); }
