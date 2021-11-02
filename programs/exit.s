# PURPOSE: Simple program that exits and returns a status code
#          back to the Linux kernel

# INPUT:   none
# OUTPUT:  returns a status code.

# VARIABLES:
#          %eax holds the system call number
#          %ebx holds the return status
#
.section .data

.section .text
.globl _start
_start:
  movl $1, %eax       # linux kernel system call for exit
  movl $0, %ebx       # status code we will return to the OS

  int $0x80

