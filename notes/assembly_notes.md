# Notes

## Structure of an Assembly Program
Any lines beginning with `#` (C style supported too) are comments and are ignored by the assembler.

`.section .text` starts the text section which is where the code goes.
`.section .data` starts the data section. The data section contains variables that
are used by the program.

`.globl _start` instructs the assembler that `_start` is an important global symbol. Symbols are
used to mark locations of programs or data and are replaced by something else during linking or
assembly. `_start` is the entrypoint (similar to `main()` in C)

## Assembly Notes
The format is `movl VALUE, REGISTER` unlike Intels `mov REGISTER, VALUE`.
In GAS, the size of the instruction follows the instruction eg `movl` or `movw`.

`movl $0, %eax` means move 0 in **immediate mode** to the register eax.

`movl data_items(,%edi,4), %eax` means:
- start at the beginning of data_items (because `%edi` is 0)
- remember each number takes up 4 storage locations
- store the number in `%eax`

The general format is `movl START_ADDRESS(,%INDEX_REGISTER,WORD_SIZE)`

### Directives
- `.byte` - bytes take up one storage location for each number, limited between 0 and 255
- `.int`  - ints take up two locations for each number. They are between 0 and 65535
- `.long` - longs take up four locations. They can hold numbers between 0 and 4294967295.
- `.ascii` - allow us to enter ASCII characters/string. Each character takes 1 byte, and we
  end the string by entering a `\0` (null character).

## Jumps
- `je` - jump if the values are equal
- `jne` - jump if the values are not equal
- `jg` - jump if the second value is greater than the first value
- `jge` - jump if the second value is greater than or equal to the first value
- `jl` - jump if the second value is less than the first value
- `jle` - jump if the second value isless than or equal to the first value

`jmp` is an unconditonal jump, it does not need to be preceeded by a comparison.

## Addressing Modes

### Direct addressing mode
This is done by only using the `ADDRESS_OR_OFFSET` part.
`movl ADDRESS, %eax`

It loads `%eax` with the value at the memory address called `ADDRESS`

### Indexed addressing mode
This is done by using the `ADDRESS_OR_OFFSET` part and the `%INDEX` part.
- We can use any general-purpose register as the index register. 
- We can have a constant multiplier of 1, 2, or 4 for the index register to make it
  easier to index by bytes, words etc.

Assume we have a string of bytes as `string_start` and want to access the third one (index 2)
and that `%ecx` held the value of 2.

`movl string_start(,%ecx,1), %eax`
This starts at `string_start` and adds `1 * %ecx` to the address and loads it into `%eax`