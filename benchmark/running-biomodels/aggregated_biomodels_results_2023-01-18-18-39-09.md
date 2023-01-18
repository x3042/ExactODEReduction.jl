#2023-01-18T18:39:10.058

## (Aggregated) Benchmark results for `find_reductions`.
All systems.


| Dimension | # Systems | # Reductions | # *nonzero* Reductions | # *nonzero* Reductions (honest) | Min runtime | Rutime | Max runtime |
| --------- | --------- | ------------ | ---------------------- | ------------------------------- | ----------- | ------ | ----------- |
| 2 - 9 | 44| 4.02| 1.55| 1.39| 0.0 s| 0.06 s| 0.66 s|
| 10 - 19 | 41| 8.15| 3.12| 2.61| 0.01 s| 0.21 s| 1.46 s|
| 20 - 29 | 46| 9.65| 3.15| 2.13| 0.08 s| 0.44 s| 1.48 s|
| 30 - 39 | 17| 19.41| 5.12| 2.71| 0.33 s| 1.74 s| 5.91 s|
| 40 - 59 | 25| 29.08| 10.52| 6.08| 0.78 s| 4.58 s| 26.71 s|
| 60 - 79 | 20| 37.25| 9.5| 6.95| 7.7 s| 34.57 s| 102.92 s|
| 80 - 99 | 11| 42.91| 11.09| 7.09| 22.46 s| 96.38 s| 497.26 s|
| 100 - 150 | 4| 89.0| 21.75| 21.5| 75.15 s| 202.52 s| 312.02 s|

Julia Version 1.8.2
- Commit 36034abf26 (2022-09-29 15:21 UTC)
- Platform Info:
-   OS: Windows (x86_64-w64-mingw32)
-   CPU: 8 × Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
-   WORD_SIZE: 64
-   LIBM: libopenlibm
-   LLVM: libLLVM-13.0.1 (ORCJIT, skylake)
-   Threads: 4 on 8 virtual cores
- Environment:
-   JULIA_EDITOR = code
-   JULIA_NUM_THREADS = 4

