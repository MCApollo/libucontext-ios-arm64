#ifndef UCONTEXT_H
#define UCONTEXT_H	1

#include <sys/_types/_sigset_t.h>
#include <sys/_types/_sigaltstack.h>

# define __ctx(fld) fld
typedef struct
  {
    unsigned long long int __ctx(fault_address);
    unsigned long long int __ctx(regs)[31];
    unsigned long long int __ctx(sp);
    unsigned long long int __ctx(pc);
    unsigned long long int __ctx(pstate);
    /* This field contains extension records for additional processor
       state such as the FP/SIMD state.  It has to match the definition
       of the corresponding field in the sigcontext struct, see the
       arch/arm64/include/uapi/asm/sigcontext.h linux header for details.  */
    unsigned char __reserved[4096] __attribute__ ((__aligned__ (16)));
  } mcontext_t;

/* Userlevel context.  */
typedef struct ucontext_t
  {
    unsigned long __ctx(uc_flags);
    struct ucontext_t *uc_link;
    stack_t uc_stack;
    sigset_t uc_sigmask;
    mcontext_t uc_mcontext;
  } ucontext_t;

#undef __ctx

#endif /* sys/ucontext.h */
