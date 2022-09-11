#2022-09-11T14:16:18.498

## Benchmark results for `find_some_reduction`.
Systems of sizes from 20 to 50.

### Resulting reductions
| System | Dimension | Reduction found? |
| ------ | --------- | ---------------- |
| BIOMD0000000001.ode | 46| Reduced to zero |
| BIOMD0000000002.ode | 47| Reduced to zero |
| BIOMD0000000009.ode | 22| Reduced to zero |
| BIOMD0000000011.ode | 22| Reduced to zero |
| BIOMD0000000026.ode | 27| Reduced to zero |
| BIOMD0000000028.ode | 43| Reduced to zero |
| BIOMD0000000030.ode | 50| Reduced to zero |
| BIOMD0000000186.ode | 24| Reduced to zero |
| BIOMD0000000187.ode | 24| Reduced to zero |
| BIOMD0000000198.ode | 22| Reduced to zero |
| BIOMD0000000200.ode | 21| Reduced to zero |
| BIOMD0000000357.ode | 21| Reduced to zero |
| BIOMD0000000364.ode | 35| Reduced to zero |
| BIOMD0000000365.ode | 39| Reduced to zero |
| BIOMD0000000069.ode | 27| Reduced to zero |
| BIOMD0000000091.ode | 39| Reduced to zero |
| BIOMD0000000094.ode | 35| Reduced to zero |
| BIOMD0000000099.ode | 23| Reduced to zero |
| BIOMD0000000108.ode | 28| Reduced to zero |
| BIOMD0000000122.ode | 36| Reduced to zero |
| BIOMD0000000123.ode | 36| Reduced to zero |
| BIOMD0000000147.ode | 26| Reduced to zero |
| BIOMD0000000163.ode | 36| Reduced to zero |
| BIOMD0000000188.ode | 39| Reduced to zero |
| BIOMD0000000189.ode | 32| Reduced to zero |
| BIOMD0000000226.ode | 46| Reduced to zero |
| BIOMD0000000229.ode | 23| Reduced to zero |
| BIOMD0000000243.ode | 41| Reduced to zero |
| BIOMD0000000257.ode | 29| Reduced to zero |
| BIOMD0000000281.ode | 32| Reduced to zero |
| BIOMD0000000314.ode | 24| Reduced to zero |
| BIOMD0000000342.ode | 42| Reduced to zero |
| BIOMD0000000389.ode | 26| Reduced to zero |
| BIOMD0000000407.ode | 50| Reduced to zero |
| BIOMD0000000430.ode | 23| New dimension: 22 |
| BIOMD0000000431.ode | 27| New dimension: 26 |
| BIOMD0000000439.ode | 21| Reduced to zero |
| BIOMD0000000447.ode | 37| Reduced to zero |
| BIOMD0000000475.ode | 23| Reduced to zero |
| BIOMD0000000479.ode | 29| Reduced to zero |
| BIOMD0000000500.ode | 20| Reduced to zero |
| BIOMD0000000501.ode | 41| Reduced to zero |
| BIOMD0000000581.ode | 28| Reduced to zero |
| MODEL1202090002.ode | 45| Reduced to zero |
| PP_n_2.ode | 30| Reduced to zero |
| MODEL8262229752.ode | 47| Reduced to zero |
| e2.ode | 24| Reduced to zero |
| MODEL1004070000.ode | 32| Reduced to zero |
| MODEL1202090001.ode | 44| Reduced to zero |
| MODEL1202090002.ode | 45| Reduced to zero |
| MODEL1202090003.ode | 45| Reduced to zero |
| MODEL6185511733.ode | 21| Reduced to zero |
| MODEL6185746832.ode | 32| Reduced to zero |
| MODEL1012080000.ode | 46| Reduced to zero |
| MODEL1012090002.ode | 50| Reduced to zero |
| MODEL1112260000.ode | 27| Reduced to zero |
| MODEL1112260001.ode | 41| Reduced to zero |
| MODEL1112260002.ode | 40| Reduced to zero |
| MODEL1204060000.ode | 23| New dimension: 11 |
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
| MODEL1308080003.ode | 44| Reduced to zero |
| MODEL1510230001.ode | 29| Reduced to zero |
| MODEL1510230002.ode | 29| Reduced to zero |
| MODEL1510230003.ode | 29| Reduced to zero |
| MODEL1510230004.ode | 38| Reduced to zero |
| MODEL1510230005.ode | 38| Reduced to zero |
| MODEL2937159804.ode | 22| Reduced to zero |
| MODEL4816599063.ode | 28| Reduced to zero |
| MODEL8262229752.ode | 46| Reduced to zero |
| MODEL9080747936.ode | 49| Reduced to zero |
| MODEL9147975215.ode | 37| Reduced to zero |
### Benchmark outline
All timing here and below are given in **seconds**.
Median timings:

| Total time | find_basis | find_radical | general_kernel | invariant_subspace_semisimple |
| ---------- | ---------- | ------------ | -------------- | ----------------------------- |
| 2.24 | 1.76 | 0.34 | 0.01 | 0.0 |
### Benchmark results

| System | Dimension | Total time | find_basis | find_radical | general_kernel | invariant_subspace_semisimple |
| ------ | --------- | ---------- | ---------- | ------------ | -------------- | ----------------------------- |
| BIOMD0000000001.ode | 46| 5.06 | 4.36 | 0.54 | 0.16 | 0.0 |
| BIOMD0000000002.ode | 47| 7.04 | 6.27 | 0.56 | 0.21 | 0.0 |
| BIOMD0000000009.ode | 22| 0.94 | 0.68 | 0.26 | 0.01 | 0.0 |
| BIOMD0000000011.ode | 22| 1.09 | 0.75 | 0.34 | 0.01 | 0.0 |
| BIOMD0000000026.ode | 27| 0.82 | 0.62 | 0.18 | 0.01 | 0.0 |
| BIOMD0000000028.ode | 43| 7.06 | 6.22 | 0.64 | 0.2 | 0.0 |
| BIOMD0000000030.ode | 50| 15.17 | 13.6 | 1.26 | 0.31 | 0.0 |
| BIOMD0000000186.ode | 24| 0.48 | 0.3 | 0.17 | 0.01 | 0.0 |
| BIOMD0000000187.ode | 24| 0.41 | 0.37 | 0.03 | 0.01 | 0.0 |
| BIOMD0000000198.ode | 22| 0.3 | 0.14 | 0.16 | 0.0 | 0.0 |
| BIOMD0000000200.ode | 21| 1.43 | 1.11 | 0.31 | 0.0 | 0.0 |
| BIOMD0000000357.ode | 21| 0.29 | 0.26 | 0.03 | 0.01 | 0.0 |
| BIOMD0000000364.ode | 35| 3.2 | 2.79 | 0.33 | 0.07 | 0.0 |
| BIOMD0000000365.ode | 39| 30.94 | 27.58 | 3.04 | 0.32 | 0.0 |
| BIOMD0000000069.ode | 27| 2.24 | 2.1 | 0.13 | 0.01 | 0.0 |
| BIOMD0000000091.ode | 39| 3.85 | 3.46 | 0.31 | 0.08 | 0.0 |
| BIOMD0000000094.ode | 35| 12.65 | 10.42 | 2.17 | 0.06 | 0.0 |
| BIOMD0000000099.ode | 23| 0.03 | 0.02 | 0.01 | 0.0 | 0.0 |
| BIOMD0000000108.ode | 28| 0.24 | 0.22 | 0.01 | 0.01 | 0.0 |
| BIOMD0000000122.ode | 36| 6.23 | 5.32 | 0.64 | 0.27 | 0.0 |
| BIOMD0000000123.ode | 36| 6.39 | 5.87 | 0.47 | 0.05 | 0.0 |
| BIOMD0000000147.ode | 26| 3.28 | 2.65 | 0.62 | 0.01 | 0.0 |
| BIOMD0000000163.ode | 36| 2.2 | 1.76 | 0.28 | 0.17 | 0.0 |
| BIOMD0000000188.ode | 39| 1.66 | 1.38 | 0.1 | 0.18 | 0.0 |
| BIOMD0000000189.ode | 32| 0.32 | 0.13 | 0.02 | 0.17 | 0.0 |
| BIOMD0000000226.ode | 46| 3.47 | 2.97 | 0.31 | 0.18 | 0.0 |
| BIOMD0000000229.ode | 23| 0.02 | 0.02 | 0.0 | 0.0 | 0.0 |
| BIOMD0000000243.ode | 41| 1.02 | 0.77 | 0.18 | 0.07 | 0.0 |
| BIOMD0000000257.ode | 29| 1.84 | 1.57 | 0.25 | 0.02 | 0.0 |
| BIOMD0000000281.ode | 32| 7.0 | 5.7 | 1.12 | 0.18 | 0.0 |
| BIOMD0000000314.ode | 24| 0.18 | 0.15 | 0.02 | 0.01 | 0.0 |
| BIOMD0000000342.ode | 42| 4.77 | 4.28 | 0.39 | 0.1 | 0.0 |
| BIOMD0000000389.ode | 26| 0.68 | 0.53 | 0.15 | 0.01 | 0.0 |
| BIOMD0000000407.ode | 50| 23.15 | 19.95 | 2.69 | 0.51 | 0.0 |
| BIOMD0000000430.ode | 23| 2.14 | 1.77 | 0.37 | 0.0 | 0.0 |
| BIOMD0000000431.ode | 27| 3.5 | 2.63 | 0.87 | 0.0 | 0.0 |
| BIOMD0000000439.ode | 21| 0.46 | 0.31 | 0.14 | 0.01 | 0.0 |
| BIOMD0000000447.ode | 37| 2.46 | 2.1 | 0.22 | 0.14 | 0.0 |
| BIOMD0000000475.ode | 23| 1.53 | 1.14 | 0.39 | 0.0 | 0.0 |
| BIOMD0000000479.ode | 29| 3.93 | 3.21 | 0.71 | 0.01 | 0.0 |
| BIOMD0000000500.ode | 20| 0.82 | 0.76 | 0.05 | 0.0 | 0.0 |
| BIOMD0000000501.ode | 41| 21.84 | 19.96 | 1.77 | 0.1 | 0.0 |
| BIOMD0000000581.ode | 28| 1.69 | 1.48 | 0.18 | 0.02 | 0.0 |
| MODEL1202090002.ode | 45| 19.81 | 18.31 | 1.26 | 0.23 | 0.0 |
| PP_n_2.ode | 30| 6.09 | 5.23 | 0.84 | 0.03 | 0.0 |
| MODEL8262229752.ode | 47| 4.19 | 3.58 | 0.48 | 0.13 | 0.0 |
| e2.ode | 24| 2.29 | 1.66 | 0.62 | 0.01 | 0.0 |
| MODEL1004070000.ode | 32| 10.56 | 8.46 | 2.05 | 0.05 | 0.0 |
| MODEL1202090001.ode | 44| 16.93 | 15.19 | 1.45 | 0.28 | 0.0 |
| MODEL1202090002.ode | 45| 21.19 | 19.65 | 1.3 | 0.24 | 0.0 |
| MODEL1202090003.ode | 45| 21.25 | 19.6 | 1.48 | 0.18 | 0.0 |
| MODEL6185511733.ode | 21| 0.16 | 0.13 | 0.02 | 0.01 | 0.0 |
| MODEL6185746832.ode | 32| 1.84 | 1.52 | 0.25 | 0.07 | 0.0 |
| MODEL1012080000.ode | 46| 7.51 | 6.7 | 0.59 | 0.22 | 0.0 |
| MODEL1012090002.ode | 50| 2.71 | 2.23 | 0.28 | 0.21 | 0.0 |
| MODEL1112260000.ode | 27| 0.65 | 0.59 | 0.05 | 0.01 | 0.0 |
| MODEL1112260001.ode | 41| 6.67 | 5.72 | 0.71 | 0.23 | 0.0 |
| MODEL1112260002.ode | 40| 7.01 | 6.32 | 0.58 | 0.11 | 0.0 |
| MODEL1204060000.ode | 23| 0.48 | 0.41 | 0.07 | 0.01 | 0.0 |
| MODEL1204240000.ode | 41| 9.91 | 7.91 | 1.86 | 0.14 | 0.0 |
| MODEL1204280017.ode | 22| 2.16 | 1.81 | 0.34 | 0.0 | 0.0 |
| MODEL1204280018.ode | 21| 1.24 | 0.9 | 0.34 | 0.0 | 0.0 |
| MODEL1204280019.ode | 21| 1.17 | 0.83 | 0.33 | 0.0 | 0.0 |
| MODEL1204280021.ode | 25| 2.66 | 1.99 | 0.67 | 0.0 | 0.0 |
| MODEL1204280022.ode | 24| 2.17 | 1.63 | 0.54 | 0.0 | 0.0 |
| MODEL1204280023.ode | 24| 2.26 | 1.58 | 0.68 | 0.0 | 0.0 |
| MODEL1204280025.ode | 22| 1.48 | 1.13 | 0.35 | 0.0 | 0.0 |
| MODEL1204280026.ode | 21| 1.31 | 1.0 | 0.31 | 0.0 | 0.0 |
| MODEL1204280027.ode | 21| 1.29 | 0.87 | 0.41 | 0.0 | 0.0 |
| MODEL1204280028.ode | 23| 1.83 | 1.24 | 0.58 | 0.0 | 0.0 |
| MODEL1204280029.ode | 25| 2.9 | 2.16 | 0.74 | 0.0 | 0.0 |
| MODEL1204280030.ode | 24| 2.19 | 1.64 | 0.55 | 0.0 | 0.0 |
| MODEL1204280031.ode | 24| 2.3 | 1.63 | 0.67 | 0.0 | 0.0 |
| MODEL1204280032.ode | 27| 3.67 | 2.54 | 1.05 | 0.09 | 0.0 |
| MODEL1308080003.ode | 44| 3.34 | 2.99 | 0.23 | 0.12 | 0.0 |
| MODEL1510230001.ode | 29| 1.08 | 0.94 | 0.12 | 0.01 | 0.0 |
| MODEL1510230002.ode | 29| 1.08 | 0.93 | 0.13 | 0.01 | 0.0 |
| MODEL1510230003.ode | 29| 1.08 | 0.93 | 0.13 | 0.01 | 0.0 |
| MODEL1510230004.ode | 38| 3.25 | 2.87 | 0.33 | 0.05 | 0.0 |
| MODEL1510230005.ode | 38| 3.32 | 2.89 | 0.32 | 0.11 | 0.0 |
| MODEL2937159804.ode | 22| 0.15 | 0.07 | 0.07 | 0.0 | 0.0 |
| MODEL4816599063.ode | 28| 1.34 | 1.18 | 0.15 | 0.01 | 0.0 |
| MODEL8262229752.ode | 46| 1.66 | 1.38 | 0.19 | 0.09 | 0.0 |
| MODEL9080747936.ode | 49| 47.56 | 38.18 | 9.25 | 0.13 | 0.0 |
| MODEL9147975215.ode | 37| 15.66 | 12.55 | 3.03 | 0.07 | 0.0 |

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

