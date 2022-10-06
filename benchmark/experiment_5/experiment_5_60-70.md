#2022-10-06T17:38:46.389

## Benchmark results for `find_reductions`.
Systems of sizes from 60 to 70.

### Benchmark outline
All timing here and below are given in **seconds**.
Computed **13** models of sizes from 60 to 70.

| Total time median | Total time average |Total time std |
| ---------- | ---------- | ------------ |
| 25.117| 48.134| 49.672|
### Benchmark results

| System | Dimension | Total time |
| ------ | --------- | ---------- |
| BIOMD0000000315.ode | 62| 19.593 |
| BIOMD0000000103.ode | 66| 12.39 |
| BIOMD0000000139.ode | 64| 16.175 |
| BIOMD0000000140.ode | 64| 15.249 |
| BIOMD0000000152.ode | 65| 129.707 |
| BIOMD0000000582.ode | 68| 25.117 |
| MODEL1604100000.ode | 63| 171.189 |
| MODEL1012090003.ode | 61| 22.524 |
| MODEL1012090004.ode | 66| 25.198 |
| MODEL1012090005.ode | 69| 34.238 |
| MODEL1705030000.ode | 70| 20.013 |
| MODEL9071122126.ode | 64| 77.052 |
| MODEL9147232940.ode | 63| 57.291 |

Julia Version 1.8.2
Commit 36034abf260 (2022-09-29 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
  CPU: 8 × Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake)
  Threads: 1 on 8 virtual cores
Environment:
  JULIA_EDITOR = code
  JULIA_NUM_THREADS = 

