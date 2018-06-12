.section .rom

msg: .ascii "Hello World!\n"

.equ msg_len, .-msg
.equ sys_write, 4
.equ sys_exit, 1
.equ stdout, 1
.equ kernel, 0x80

.section .text

.global _start

_start:
  /* TODO: _write(stdout, msg, msg_len) */
  /* ... */

  /* _exit(0) */
  and $0xfffffff0, %esp
  sub $0x40, %esp
  movl $0, 0x18(%esp) /* exit status */
  lea 0x10(%esp), %ebx
  movl $1, 0x04(%ebx)  /* EXIT in include/minix/callnr.h */
  movl $0, %eax        /* PM_PROC_NR in include/minix/com.h */
  movl $3, %ecx      /* SENDREC in include/minix/ipcconst.h */
  int $33              /* IPCVEC_ORIG in sys/arch/i386/include/asm.h */
