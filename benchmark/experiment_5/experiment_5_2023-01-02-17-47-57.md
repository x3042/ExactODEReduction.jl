#2023-01-02T19:23:47.482

## (Aggregated) Benchmark results for `find_reductions`.
All systems.


| Dimension | # Systems | # Reductions | # *nonzero* Reductions | # *nonzero* Reductions (honest) | Min runtime | Rutime | Max runtime |
| --------- | --------- | ------------ | ---------------------- | ------------------------------- | ----------- | ------ | ----------- |
| 2 - 9 | 44| 4.02| 1.52| 1.36| 0.0 s| 0.02 s| 0.16 s|
| 10 - 19 | 41| 8.15| 3.12| 2.61| 0.0 s| 0.12 s| 0.84 s|
| 20 - 29 | 46| 9.65| 3.15| 2.13| 0.06 s| 0.31 s| 1.16 s|
| 30 - 39 | 17| 19.41| 5.12| 2.71| 0.21 s| 1.15 s| 3.72 s|
| 40 - 59 | 25| 29.08| 10.52| 6.08| 0.53 s| 2.86 s| 16.42 s|
| 60 - 79 | 20| 37.25| 9.5| 6.95| 4.95 s| 21.64 s| 63.54 s|
| 80 - 99 | 11| 42.91| 11.09| 7.09| 14.04 s| 54.95 s| 245.87 s|
| 100 - 150 | 4| 89.0| 21.75| 21.5| 64.36 s| 146.73 s| 205.17 s|

Julia Version 1.8.2
- Commit 36034abf260 (2022-09-29 15:21 UTC)
- Platform Info:
-   OS: Linux (x86_64-linux-gnu)
-   CPU: 256 × AMD EPYC 7702 64-Core Processor
-   WORD_SIZE: 64
-   LIBM: libopenlibm
-   LLVM: libLLVM-13.0.1 (ORCJIT, znver2)
-   Threads: 1 on 256 virtual cores
- Environment:
-   JULIA_EDITOR = code
-   JULIA_NUM_THREADS = 

