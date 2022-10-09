#2022-10-09T22:59:13.745

## (Segregated) Benchmark results for `find_reductions`.
All systems.


| Dimension | # Systems | # Reductions, on average | # *nonzero* Reductions, on average | Rutime, on average |
| --------- | --------- | ------------------------ | ---------------------------------- |------------------- |
| 2 - 9 | 44| 4.0227| 1.5| 0.1205 s|
| 10 - 19 | 41| 8.1463| 3.122| 0.3549 s|
| 20 - 39 | 63| 12.2857| 3.6825| 1.0863 s|
| 40 - 59 | 25| 29.08| 10.52| 5.0316 s|
| 60 - 79 | 20| 37.25| 9.5| 95.5244 s|
| 80 - 99 | 11| 42.9091| 11.0909| 75.2626 s|
| 100 - 150 | 4| 89.0| 21.75| 170.9484 s|

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

