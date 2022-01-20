
#include <stdint.h>
#include <cuda.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "lib/hash/sha256.cu"
#include "lib/Math.cuh"


__global__ void kernelUncompressed(bool* buffResult, uint64_t* buffRangeStart, uint64_t* buffStride, const int threadNumberOfChecks);
__global__ void kernelCompressed(bool* buffResult, uint64_t* buffRangeStart, uint64_t* buffStride, const int threadNumberOfChecks);

__global__ void resultCollector(bool* buffResult, uint64_t* buffCombinedResult, const uint64_t threadNumberOfChecks);

__device__ bool _checksumDoubleSha256CheckUncompressed(unsigned int checksum, beu32* d_hash, uint64_t* _start);
__device__ bool _checksumDoubleSha256CheckCompressed(unsigned int checksum, beu32* d_hash, uint64_t* _start);

__device__ bool _checksumDoubleSha256(unsigned int checksum, beu32* d_hash);

__device__ void _add(uint64_t* C, uint64_t* A);
__device__ void _load(uint64_t* C, uint64_t* A);

__device__ void IMult(uint64_t* r, uint64_t* a, int64_t b); 