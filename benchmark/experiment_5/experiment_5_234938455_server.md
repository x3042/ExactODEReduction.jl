#2022-10-11T22:59:59.674

## (Aggregated) Benchmark results for `find_reductions`.
All systems.


| Dimension | # Systems | # Reductions | # *nonzero* Reductions | Rutime | Min runtime | Max runtime |
| --------- | --------- | ------------ | ---------------------- |------- | ----------- | ----------- |
| 2 - 9 | 44| 4.0| 1.0| 0.1035 s| 0.0014 s| 0.3022 s|
| 10 - 19 | 41| 7.0| 3.0| 0.3336 s| 0.0147 s| 1.0809 s|
| 20 - 29 | 46| 9.0| 1.0| 0.6228 s| 0.0888 s| 1.6422 s|
| 30 - 39 | 17| 23.0| 3.0| 1.9171 s| 1.1549 s| 5.4313 s|
| 40 - 59 | 25| 31.0| 9.0| 4.1416 s| 1.4771 s| 17.2603 s|
| 60 - 79 | 20| 45.0| 7.0| 22.6271 s| 9.4807 s| 1239.5072 s|
| 80 - 99 | 11| 54.0| 11.0| 32.3123 s| 24.4389 s| 327.6529 s|
| 100 - 150 | 4| 90.5| 11.5| 181.5747 s| 73.608 s| 247.0364 s|

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

