#2022-10-05T15:23:27.275

## Benchmark results for `find_some_reduction`.
Systems of sizes from 20 to 50.

**New matrices and modular.**### Resulting reductions
| System | Dimension | Reduction found? |
| ------ | --------- | ---------------- |
| BIOMD0000000001.ode | 46| Reduced to zero |
| BIOMD0000000002.ode | 47| Reduced to zero |
| BIOMD0000000009.ode | 22| New dimension: 20 |
| BIOMD0000000011.ode | 22| Reduced to zero |
| BIOMD0000000026.ode | 27| Reduced to zero |
| BIOMD0000000028.ode | 43| Reduced to zero |
| BIOMD0000000030.ode | 50| Reduced to zero |
| BIOMD0000000186.ode | 24| New dimension: 23 |
| BIOMD0000000187.ode | 24| New dimension: 23 |
| BIOMD0000000198.ode | 22| New dimension: 18 |
| BIOMD0000000200.ode | 21| Reduced to zero |
| BIOMD0000000357.ode | 21| New dimension: 20 |
| BIOMD0000000364.ode | 35| New dimension: 34 |
| BIOMD0000000365.ode | 39| New dimension: 5 |
| BIOMD0000000069.ode | 27| Reduced to zero |
| BIOMD0000000091.ode | 39| New dimension: 34 |
| BIOMD0000000094.ode | 35| Reduced to zero |
| BIOMD0000000099.ode | 23| New dimension: 16 |
| BIOMD0000000108.ode | 28| Reduced to zero |
| BIOMD0000000122.ode | 36| Reduced to zero |
| BIOMD0000000123.ode | 36| Reduced to zero |
| BIOMD0000000147.ode | 26| New dimension: 25 |
| BIOMD0000000163.ode | 36| Reduced to zero |
| BIOMD0000000188.ode | 39| New dimension: 8 |
| BIOMD0000000189.ode | 32| New dimension: 21 |
| BIOMD0000000226.ode | 46| Reduced to zero |
| BIOMD0000000229.ode | 23| New dimension: 6 |
| BIOMD0000000243.ode | 41| Reduced to zero |
| BIOMD0000000257.ode | 29| New dimension: 27 |
| BIOMD0000000281.ode | 32| Reduced to zero |
| BIOMD0000000314.ode | 24| New dimension: 20 |
| BIOMD0000000342.ode | 42| Reduced to zero |
| BIOMD0000000389.ode | 26| New dimension: 17 |
| BIOMD0000000407.ode | 50| New dimension: 34 |
| BIOMD0000000430.ode | 23| New dimension: 22 |
| BIOMD0000000431.ode | 27| New dimension: 26 |
| BIOMD0000000439.ode | 21| New dimension: 15 |
| BIOMD0000000447.ode | 37| Reduced to zero |
| BIOMD0000000475.ode | 23| Reduced to zero |
| BIOMD0000000479.ode | 29| New dimension: 24 |
| BIOMD0000000500.ode | 20| New dimension: 16 |
| BIOMD0000000501.ode | 41| New dimension: 25 |
| BIOMD0000000581.ode | 28| New dimension: 23 |
| MODEL1202090002.ode | 45| New dimension: 33 |
| PP_n_2.ode | 30| New dimension: 18 |
| MODEL8262229752.ode | 47| Reduced to zero |
| e2.ode | 24| New dimension: 12 |
| MODEL1004070000.ode | 32| New dimension: 29 |
| MODEL1202090001.ode | 44| New dimension: 32 |
| MODEL1202090002.ode | 45| New dimension: 33 |
| MODEL1202090003.ode | 45| New dimension: 33 |
| MODEL6185511733.ode | 21| Reduced to zero |
| MODEL6185746832.ode | 32| Reduced to zero |
| MODEL1012080000.ode | 46| New dimension: 34 |
| MODEL1012090002.ode | 50| Reduced to zero |
| MODEL1112260000.ode | 27| Reduced to zero |
| MODEL1112260001.ode | 41| Reduced to zero |
| MODEL1112260002.ode | 40| Reduced to zero |
| MODEL1204060000.ode | 23| New dimension: 10 |
| MODEL1204240000.ode | 41| Reduced to zero |
| MODEL1204280017.ode | 22| Reduced to zero |
| MODEL1204280018.ode | 21| Reduced to zero |
| MODEL1204280019.ode | 21| Reduced to zero |
| MODEL1204280021.ode | 25| Reduced to zero |
| MODEL1204280022.ode | 24| No.. |
| MODEL1204280023.ode | 24| No.. |
| MODEL1204280025.ode | 22| Reduced to zero |
| MODEL1204280026.ode | 21| Reduced to zero |
| MODEL1204280027.ode | 21| Reduced to zero |
| MODEL1204280028.ode | 23| New dimension: 22 |
| MODEL1204280029.ode | 25| Reduced to zero |
| MODEL1204280030.ode | 24| No.. |
| MODEL1204280031.ode | 24| No.. |
| MODEL1204280032.ode | 27| New dimension: 26 |
| MODEL1308080003.ode | 44| New dimension: 26 |
| MODEL1510230001.ode | 29| New dimension: 23 |
| MODEL1510230002.ode | 29| New dimension: 23 |
| MODEL1510230003.ode | 29| New dimension: 23 |
| MODEL1510230004.ode | 38| New dimension: 32 |
| MODEL1510230005.ode | 38| New dimension: 32 |
| MODEL2937159804.ode | 22| Reduced to zero |
| MODEL4816599063.ode | 28| Reduced to zero |
| MODEL8262229752.ode | 46| Reduced to zero |
| MODEL9080747936.ode | 49| Reduced to zero |
| MODEL9147975215.ode | 37| New dimension: 36 |
### Benchmark outline
All timing here and below are given in **seconds**.
Median timings:

| Total time | find_basis | find_radical | general_kernel | invariant_subspace_semisimple |
| ---------- | ---------- | ------------ | -------------- | ----------------------------- |
| 0.0 | 0.62 | 0.91 | 0.06 | 0.0 |
### Benchmark results

| System | Dimension | Total time | find_basis | find_radical | general_kernel | invariant_subspace_semisimple |
| ------ | --------- | ---------- | ---------- | ------------ | -------------- | ----------------------------- |
| BIOMD0000000001.ode | 46| 6.79 | 2.29 | 1.47 | 0.43 | 0.0 |
| BIOMD0000000002.ode | 47| 4.82 | 2.67 | 1.77 | 0.38 | 0.0 |
| BIOMD0000000009.ode | 22| 0.0 | 0.32 | 0.53 | 0.15 | 0.0 |
| BIOMD0000000011.ode | 22| 0.99 | 0.48 | 0.08 | 0.05 | 0.0 |
| BIOMD0000000026.ode | 27| 0.62 | 2.77 | 1.87 | 1.07 | 0.0 |
| BIOMD0000000028.ode | 43| 5.71 | 7.44 | 3.81 | 0.44 | 0.0 |
| BIOMD0000000030.ode | 50| 11.7 | 0.47 | 0.38 | 0.04 | 0.0 |
| BIOMD0000000186.ode | 24| 0.0 | 0.77 | 0.39 | 0.05 | 0.0 |
| BIOMD0000000187.ode | 24| 0.0 | 2.0 | 1.4 | 0.07 | 0.0 |
| BIOMD0000000198.ode | 22| 0.0 | 2.16 | 1.21 | 0.28 | 0.0 |
| BIOMD0000000200.ode | 21| 0.89 | 2.96 | 27.48 | 0.09 | 0.0 |
| BIOMD0000000357.ode | 21| 0.0 | 0.05 | 0.02 | 0.0 | 0.0 |
| BIOMD0000000364.ode | 35| 0.0 | 0.37 | 0.75 | 0.06 | 0.0 |
| BIOMD0000000365.ode | 39| 0.0 | 0.2 | 1.26 | 0.08 | 0.0 |
| BIOMD0000000069.ode | 27| 1.21 | 0.57 | 0.7 | 0.08 | 0.0 |
| BIOMD0000000091.ode | 39| 0.0 | 0.57 | 1.02 | 0.0 | 0.0 |
| BIOMD0000000094.ode | 35| 0.0 | 1.4 | 1.38 | 0.28 | 0.0 |
| BIOMD0000000099.ode | 23| 0.0 | 0.61 | 0.79 | 0.0 | 0.0 |
| BIOMD0000000108.ode | 28| 0.0 | 0.88 | 0.42 | 0.0 | 0.0 |
| BIOMD0000000122.ode | 36| 3.47 | 0.52 | 0.68 | 0.0 | 0.0 |
| BIOMD0000000123.ode | 36| 3.65 | 0.48 | 1.58 | 0.0 | 0.0 |
| BIOMD0000000147.ode | 26| 0.0 | 0.41 | 0.44 | 0.06 | 0.0 |

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

