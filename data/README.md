### Test suite

- `ODEs` directory contains systems from the BioModels project (https://www.ebi.ac.uk/biomodels-main/) in `.ode` files. These are currently used to benchmark the package;
- `matrices` directory contains sparse matrices in COO format in `.json` files. These were used to profile algebra basis finding algorithm;
- `sscollection` directory containts sparse matrices from SuiteSparse project *(doi: https://doi.org/10.1145/3322125)* in `.mtx` format. These were used to profile algebra basis finding algorithm;
