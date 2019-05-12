# ENEL373 - The ALU + FSM + REG project


## Objective of Project
##### The objective of this project is to design an alu component that can add, subtract, and perform bitwise AND or OR depending on the opcode/operation provided to the alu. The alu should have two 8 bit operands anda a 2 bit opcode as inputs and should produce another 8 bit operand that will be saved into a register. The values saved into the input registers or the alu input operands and the operation code are all supplied by the finite state machine. The fsm first state is the to take in the value of operand A and output it into register A is then fed into the alu. The second state of the fsm is to save the operand B and output into register B. The fsm operand input values are entered using the switches of the fpja board and the state is change by pressing BTNC.

## Inputs

> #### FSM inputs
- SW[7:0]
- BTNC
- clk
- reset

> #### ALU inputs
- opreand A
- operand B
- opcode
- clk

> #### RegisterA
- opreand A
- clk
- En

> #### RegisterB
- opreand B
- clk
- En

> #### RegisterG
- opreand G
- clk
- En

> #### BIN2BCD
- opreand G

> #### seg7 - U7
- bcd(3 downto 0)

> #### seg7 - U8
- bcd(7 downto 4)

> #### seg7 - U9
- bcd(11 downto 8)


## Outputs

> #### FSM output
- operand A
- operand B

> #### ALU output
- opreand G

> #### RegisterA
- opreand A

> #### RegisterB
- opreand B

> #### RegisterG
- opreand G

> #### BIN2BCD
- bcd code

> #### seg7 - U7
- bcd(3 downto 0)

> #### seg7 - U8
- bcd(7 downto 4)

> #### seg7 - U9
- bcd(11 downto 8)

## Buttons

> #### Up
- Enters the '+' operation for the ALU

> #### Down
- Enters the '-' operation for the ALU

> #### Left
- Enters the 'AND' operation for the ALU

> #### Right
- Enters the 'OR' operation for the ALU

> #### Center
- Changes the state of the FSM

## Contributers
> - Hassan Alhujhoj
> - Abdullah Naeem 
> - Jin Kim