# PURPOSE: This program finds the maximum number of a set
#          of data items.

# VARIABLES:
# %edi - holds the index of the data item being examined
# %ebx - largest currently found
# %eax - current data item
#
# The following memory locations are used:
#
# data_items - contains the item data
#
#

.section .data
data_items:
  .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text
.globl _start
_start:
  movl $0, %edi                   # move 0 into the index register
  movl data_items(,%edi,4), %eax  # load the first byte of data
  movl %eax, %ebx                 # since this is the first item, %eax is the largest

start_loop:
  cmpl $0, %eax                   # have we hit the end?
  je loop_exit
  incl %edi                       # load next value
  movl data_items(,%edi,4), %eax  # load the next byte of data

  cmpl %ebx, %eax                 # is eax > ebx
  jle start_loop                  # jump to start of loop if the new one isnt bigger
  movl %eax, %ebx                 # move the value as the largest

  jmp start_loop

loop_exit:
  # %ebx is the exit code and it already has the largest number
  movl $1, %eax
  int $0x80
