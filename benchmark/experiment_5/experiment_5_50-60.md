#2022-10-06T17:26:03.961

## Benchmark results for `find_reductions`.
Systems of sizes from 50 to 60.

### Benchmark outline
All timing here and below are given in **seconds**.
Computed **8** models of sizes from 50 to 60.

| Total time median | Total time average |Total time std |
| ---------- | ---------- | ------------ |
| 8.123| 10.171| 6.645|
### Benchmark results

| System | Dimension | Total time |
| ------ | --------- | ---------- |
| BIOMD0000000030.ode | 50| 11.265 |
| BIOMD0000000270.ode | 58| 5.319 |
| BIOMD0000000102.ode | 56| 6.886 |
| BIOMD0000000287.ode | 57| 7.943 |
| BIOMD0000000407.ode | 50| 8.303 |
| BIOMD0000000580.ode | 54| 5.589 |
| MODEL1012090002.ode | 50| 10.273 |
| MODEL9085850385.ode | 59| 25.794 |

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

