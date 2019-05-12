# ENEL373 - The ALU + FSM + REG project

## Contributers
> - Hassan Alhujhoj
> - Abdullah Naeem 
> - Jin Kim

## Objective of Project
#####    The objective of this project is to design an alu component that can add, subtract, and perform bitwise AND or OR depending on the opcode/operation provided to the alu. The alu should have two 8 bit operands anda a 2 bit opcode as inputs and should produce another 8 bit operand that will be saved into a register. The values saved into the input registers or the alu input operands and the operation code are all supplied by the finite state machine. The fsm first state is the to take in the value of operand A and output it into register A is then fed into the alu. The second state of the fsm is to save the operand B and output into register B. The fsm operand input values are entered using the switches of the fpja board and the state is change by pressing BTNC.