#2022-09-11T15:53:15.312

## Benchmark results for `find_some_reduction`.
Systems of sizes from 80 to 110.

### Resulting reductions
| System | Dimension | Reduction found? |
| ------ | --------- | ---------------- |
| BIOMD0000000014.ode | 86| Reduced to zero |
| BIOMD0000000230.ode | 89| Reduced to zero |
| BIOMD0000000559.ode | 101| Reduced to zero |
| BIOMD0000000640.ode | 81| Reduced to zero |
| MODEL1004010000.ode | 84| Reduced to zero |
| MODEL1004010001.ode | 84| Reduced to zero |
| MODEL1004010002.ode | 84| Reduced to zero |
| MODEL1012090006.ode | 84| Reduced to zero |
| MODEL1108260014.ode | 82| Reduced to zero |
| MODEL1109150002.ode | 93| Reduced to zero |
| MODEL9079179924.ode | 81| Reduced to zero |
| MODEL9086926384.ode | 80| Reduced to zero |
### Benchmark outline
All timing here and below are given in **seconds**.
Median timings:

| Total time | find_basis | find_radical | general_kernel | invariant_subspace_semisimple |
| ---------- | ---------- | ------------ | -------------- | ----------------------------- |
| 229.47 | 197.75 | 15.09 | 2.64 | 0.0 |
### Benchmark results

| System | Dimension | Total time | find_basis | find_radical | general_kernel | invariant_subspace_semisimple |
| ------ | --------- | ---------- | ---------- | ------------ | -------------- | ----------------------------- |
| BIOMD0000000014.ode | 86| 1862.88 | 1183.49 | 676.48 | 2.9 | 0.0 |
| BIOMD0000000230.ode | 89| 135.53 | 120.6 | 6.92 | 8.01 | 0.0 |
| BIOMD0000000559.ode | 101| 550.82 | 522.16 | 21.63 | 7.03 | 0.0 |
| BIOMD0000000640.ode | 81| 141.04 | 130.98 | 7.11 | 2.95 | 0.0 |
| MODEL1004010000.ode | 84| 157.9 | 147.38 | 8.14 | 2.38 | 0.0 |
| MODEL1004010001.ode | 84| 169.62 | 158.78 | 8.53 | 2.3 | 0.0 |
| MODEL1004010002.ode | 84| 174.85 | 162.18 | 8.54 | 4.13 | 0.0 |
| MODEL1012090006.ode | 84| 71.5 | 67.36 | 2.86 | 1.28 | 0.0 |
| MODEL1108260014.ode | 82| 284.08 | 233.33 | 48.56 | 2.2 | 0.0 |
| MODEL1109150002.ode | 93| 799.8 | 749.05 | 46.52 | 4.23 | 0.0 |
| MODEL9079179924.ode | 81| 842.9 | 645.21 | 196.61 | 1.08 | 0.0 |
| MODEL9086926384.ode | 80| 506.5 | 384.71 | 120.11 | 1.69 | 0.0 |

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

