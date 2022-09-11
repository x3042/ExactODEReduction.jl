#2022-09-11T14:16:18.507

## Benchmark results for `find_some_reduction`.
Systems of sizes from 50 to 80.

### Resulting reductions
| System | Dimension | Reduction found? |
| ------ | --------- | ---------------- |
| BIOMD0000000030.ode | 50| Reduced to zero |
| BIOMD0000000270.ode | 58| Reduced to zero |
| BIOMD0000000315.ode | 62| Reduced to zero |
| BIOMD0000000335.ode | 76| Reduced to zero |
| BIOMD0000000362.ode | 78| Reduced to zero |
| BIOMD0000000102.ode | 56| Reduced to zero |
| BIOMD0000000103.ode | 66| Reduced to zero |
| BIOMD0000000139.ode | 64| Reduced to zero |
| BIOMD0000000140.ode | 64| Reduced to zero |
| BIOMD0000000152.ode | 65| Reduced to zero |
| BIOMD0000000153.ode | 76| Reduced to zero |
| BIOMD0000000287.ode | 57| Reduced to zero |
| BIOMD0000000407.ode | 50| Reduced to zero |
| BIOMD0000000580.ode | 54| Reduced to zero |
| BIOMD0000000582.ode | 68| Reduced to zero |
| e3.ode | 72| Reduced to zero |
| MODEL1604100000.ode | 63| Reduced to zero |
| MODEL1012090002.ode | 50| Reduced to zero |
| MODEL1012090003.ode | 61| Reduced to zero |
| MODEL1012090004.ode | 66| Reduced to zero |
| MODEL1012090005.ode | 69| Reduced to zero |
| MODEL1109150000.ode | 75| Reduced to zero |
| MODEL1109150001.ode | 77| Reduced to zero |
| MODEL1705030000.ode | 70| Reduced to zero |
| MODEL1705030001.ode | 73| Reduced to zero |
| MODEL9071122126.ode | 64| Reduced to zero |
| MODEL9085850385.ode | 59| Reduced to zero |
| MODEL9086926384.ode | 80| Reduced to zero |
| MODEL9147091146.ode | 75| Reduced to zero |
| MODEL9147232940.ode | 63| Reduced to zero |
### Benchmark outline
All timing here and below are given in **seconds**.
Median timings:

| Total time | find_basis | find_radical | general_kernel | invariant_subspace_semisimple |
| ---------- | ---------- | ------------ | -------------- | ----------------------------- |
| 70.81 | 65.55 | 4.02 | 0.64 | 0.0 |
### Benchmark results

| System | Dimension | Total time | find_basis | find_radical | general_kernel | invariant_subspace_semisimple |
| ------ | --------- | ---------- | ---------- | ------------ | -------------- | ----------------------------- |
| BIOMD0000000030.ode | 50| 14.51 | 12.95 | 1.26 | 0.29 | 0.0 |
| BIOMD0000000270.ode | 58| 29.02 | 26.47 | 2.08 | 0.48 | 0.0 |
| BIOMD0000000315.ode | 62| 41.16 | 37.68 | 2.89 | 0.59 | 0.0 |
| BIOMD0000000335.ode | 76| 117.45 | 104.72 | 11.18 | 1.54 | 0.0 |
| BIOMD0000000362.ode | 78| 129.5 | 115.3 | 11.84 | 2.36 | 0.0 |
| BIOMD0000000102.ode | 56| 10.04 | 9.31 | 0.46 | 0.28 | 0.0 |
| BIOMD0000000103.ode | 66| 33.71 | 32.04 | 1.18 | 0.48 | 0.0 |
| BIOMD0000000139.ode | 64| 65.85 | 60.25 | 4.74 | 0.86 | 0.0 |
| BIOMD0000000140.ode | 64| 64.92 | 59.83 | 4.02 | 1.07 | 0.0 |
| BIOMD0000000152.ode | 65| 293.92 | 138.72 | 154.25 | 0.96 | 0.0 |
| BIOMD0000000153.ode | 76| 396.48 | 247.76 | 145.7 | 3.01 | 0.0 |
| BIOMD0000000287.ode | 57| 17.11 | 15.61 | 1.01 | 0.48 | 0.0 |
| BIOMD0000000407.ode | 50| 27.27 | 23.71 | 3.05 | 0.51 | 0.0 |
| BIOMD0000000580.ode | 54| 17.27 | 15.97 | 0.93 | 0.38 | 0.0 |
| BIOMD0000000582.ode | 68| 51.3 | 46.71 | 2.81 | 1.78 | 0.0 |
| e3.ode | 72| 601.08 | 217.03 | 381.74 | 2.31 | 0.0 |
| MODEL1604100000.ode | 63| 656.57 | 601.27 | 54.53 | 0.76 | 0.0 |
| MODEL1012090002.ode | 50| 3.75 | 3.27 | 0.21 | 0.26 | 0.0 |
| MODEL1012090003.ode | 61| 6.03 | 5.46 | 0.3 | 0.28 | 0.0 |
| MODEL1012090004.ode | 66| 4.25 | 3.73 | 0.26 | 0.26 | 0.0 |
| MODEL1012090005.ode | 69| 11.04 | 10.12 | 0.51 | 0.4 | 0.0 |
| MODEL1109150000.ode | 75| 352.39 | 315.72 | 35.37 | 1.31 | 0.0 |
| MODEL1109150001.ode | 77| 186.91 | 159.82 | 12.04 | 15.04 | 0.0 |
| MODEL1705030000.ode | 70| 75.77 | 70.85 | 3.76 | 1.16 | 0.0 |
| MODEL1705030001.ode | 73| 88.48 | 82.64 | 4.01 | 1.82 | 0.0 |
| MODEL9071122126.ode | 64| 252.76 | 204.81 | 47.58 | 0.37 | 0.0 |
| MODEL9085850385.ode | 59| 122.94 | 99.39 | 23.1 | 0.45 | 0.0 |
| MODEL9086926384.ode | 80| 617.15 | 389.52 | 225.42 | 2.21 | 0.0 |
| MODEL9147091146.ode | 75| 668.27 | 413.31 | 254.28 | 0.69 | 0.0 |
| MODEL9147232940.ode | 63| 234.14 | 184.64 | 49.34 | 0.16 | 0.0 |

Julia Version 1.7.3
Commit 742b9abb4d (2022-05-06 12:58 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
  CPU: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake)
Environment:
  JULIA_EDITOR = code
  JULIA_NUM_THREADS = 

