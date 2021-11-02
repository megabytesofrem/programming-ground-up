# Notes

## Fetch Execute Cycle
The fetch execute cycle is the instruction cycle of a computer. During the cycle, the CPU
fetches an instruction from memory, decodes it and executes it and repeats until there are no more instructions.

It is also known as the Fetch Execute Decode cycle

## Addressing Modes
- Immediate mode: The data to access is **embedded** in the instruction itself
- Register addressing mode: The instruction contains a register to access
- Direct addressing mode: The instruction contains a memory address to **directly** access 
- Indexed addressing mode: The instruction contains a memory address to access *and* specifies an index register to offset the address by. On x86 processors, you can also specify a multiplier for the index. This allows you to access memory a byte at a time or a word at a time (4 bytes). If you are accessing an entire word, your index will need to be multiplied by 4 to get the exact location of the fourth element from your address.

- Indirect addressing mode: The instruction contains a register that contains a pointer to where the data should be accessed.
- Base pointer addressing: Similar to indirect addressing mode **but** you include the offset and add it to the registers value before using it for lookup.

## Know the Concepts
- **Q: What is a register?**
A register is small memory cell in a CPU that stores a value. Registers are very fast to access, but there is very small amount of storage. They are used as scratchpads to store some values for eg math calculations.

- **Q: How do you represent numbers larger than 255?**
By carrying and using more than one byte to represent a single number.

- **Q: How big are the registers on the machines?**
The registers on the machines we will be using are 32 bits (4 bytes) in size.

## How does pipelining affect the Fetch Execute Cycle?
Pipelining keeps all portions of the processor occupied and increases the amount of useful work the processor can do in a given time. Pipelining typically **reduces** the processor's cycle time and increases the throughput of instructions.