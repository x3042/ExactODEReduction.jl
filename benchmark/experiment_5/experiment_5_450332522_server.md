#2022-10-09T23:00:31.518

## (Segregated) Benchmark results for `find_reductions`.
All systems.


| Dimension | # Systems | # Reductions, on average | # *nonzero* Reductions, on average | Rutime, on average |
| --------- | --------- | ------------------------ | ---------------------------------- |------------------- |
| 2 - 9 | 44| 4.0| 1.0| 0.1035 s|
| 10 - 19 | 41| 7.0| 3.0| 0.3336 s|
| 20 - 39 | 63| 14.0| 1.0| 0.8146 s|
| 40 - 59 | 25| 31.0| 9.0| 4.1416 s|
| 60 - 79 | 20| 45.0| 7.0| 22.6271 s|
| 80 - 99 | 11| 54.0| 11.0| 32.3123 s|
| 100 - 150 | 4| 90.5| 11.5| 181.5747 s|

Julia Version 1.7.1
Commit ac5cc99908 (2021-12-22 19:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
  CPU: AMD EPYC 7702 64-Core Processor
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, znver2)
Environment:
  JULIA_EDITOR = code
  JULIA_NUM_THREADS = 

