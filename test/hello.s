.global _start

.section .rodata

msg: .ascii "Hello World!\n"

.equ msg_len, 26
.equ kernel, 0x80

.section .text

_start:
  # write message
  # ...

  # _exit(0) #
  and $0xfffffff0, %esp
  sub $0x40, %esp
  movl $0, 0x18(%esp) /* exit status */
  lea 0x10(%esp), %ebx
  movl $1, 0x04(%ebx)  /* EXIT in include/minix/callnr.h */
  movl $0, %eax        /* PM_PROC_NR in include/minix/com.h */
  movl $0x3, %ecx      /* SENDREC in include/minix/ipcconst.h */
  int $33
