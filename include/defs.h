#ifndef __ARCH_AARCH64_DEFS_H
#define __ARCH_AARCH64_DEFS_H

// #define WEAK		1

#define REGSZ		8
#define R0_OFFSET	56
#define SP_OFFSET	304
#define PC_OFFSET	312
#define PSTATE_OFFSET	320

#ifndef FPSIMD_MAGIC
# define FPSIMD_MAGIC	0x46508001
#endif

#ifndef ESR_MAGIC
# define ESR_MAGIC	0x45535201
#endif

#endif
