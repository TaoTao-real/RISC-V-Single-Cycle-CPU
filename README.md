# RISC-V-Single-Cycle-CPU
简单的RISCV单周期处理器

## Modules
riscv_soc由riscv处理器模块和mem模块组成，mem中分别存储指令和数据，使用memread进行初始化
riscv模块划分成经典的IF，ID，EX，MEM，WB模块，在一个周期内执行完一条指令之后，接着执行下一条指令

## Set
可执行RISC-V指令子集
| Instruction | Opcode  | Funct3 | Funct6/7 |
| :---------: | :-----: | :----: | :------: |
|    `add`    | 0110011 |  000   | 0000000  |
|   `addi`    | 0010011 |  000   |   N/A    |
|    `sub`    | 0110011 |  000   | 0100000  |
|    `and`    | 0110011 |  111   | 0000000  |
|    `or`     | 0110011 |  110   | 0000000  |
|    `xor`    | 0110011 |  100   | 0000000  |
|    `blt`    | 1100111 |  100   |   N/A    |
|    `beq`    | 1100111 |  000   |   N/A    |
|    `jal`    | 1101111 |  N/A   |   N/A    |
|    `sll`    | 0110011 |  001   | 0000000  |
|    `srl`    | 0110011 |  101   | 0000000  |
|    `lw`     | 0000011 |  010   |   N/A    |
|    `sw`     | 0100011 |  010   |   N/A    |
