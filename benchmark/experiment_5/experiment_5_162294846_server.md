#2022-10-11T23:19:14.567

## (Aggregated) Benchmark results for `find_reductions`.
All systems.


| Dimension | # Systems | # Reductions | # *nonzero* Reductions | Min runtime | Rutime | Max runtime |
| --------- | --------- | ------------ | ---------------------- |------------ | ------ | ----------- |
| 2 - 9 | 44| 4.02| 1.5| 0.0 s| 0.12 s| 0.3 s|
| 10 - 19 | 41| 8.15| 3.12| 0.01 s| 0.35 s| 1.08 s|
| 20 - 29 | 46| 9.65| 3.15| 0.09 s| 0.66 s| 1.64 s|
| 30 - 39 | 17| 19.41| 5.12| 1.15 s| 2.25 s| 5.43 s|
| 40 - 59 | 25| 29.08| 10.52| 1.48 s| 5.03 s| 17.26 s|
| 60 - 79 | 20| 37.25| 9.5| 9.48 s| 95.52 s| 1239.51 s|
| 80 - 99 | 11| 42.91| 11.09| 24.44 s| 75.26 s| 327.65 s|
| 100 - 150 | 4| 89.0| 21.75| 73.61 s| 170.95 s| 247.04 s|

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

