# ENEL373 - The ALU + FSM + REG project
![Video](wiki/demo1.gif)![Video](wiki/demo2.gif)![Video](wiki/demo3.gif)![Video](wiki/demo4.gif)

## Objectives of The Project
The objective of this project is to design an ALU component that can add, subtract, and perform bitwise AND or OR depending on the opcode/operation provided to the ALU.
The ALU should have two 8 bit operands anda a 2 bit opcode as inputs and should produce another 8 bit operand that will be saved into a register. 
The values saved into the input registers or the ALU input operands and the operation code are all supplied by the finite state machine. 
The fsm first state is the to take in the value of operand A and output it into register A is then fed into the ALU. 
The second state of the FSM is to save the operand B and output into register B. 
The FSM operand input values are entered using the switches of the Nexys 4 DDR Artix-7 FPGA board and the state is changed by pressing the central button.


## Inputs

#### FSM inputs
- buttonC
- clk

#### ALU inputs
- opreand A
- operand B
- opcode
- clk

#### RegisterA
- opreand A
- clk
- enable

#### RegisterB
- opreand B
- clk
- enable

#### RegisterG
- opreand G
- clk
- enable

#### RegisterO
- opreand O
- clk
- enable

#### BIN2BCD
- opreand G

#### seg7 - U7
- bcd(3 downto 0)

#### seg7 - U8
- bcd(7 downto 4)

#### seg7 - U9
- bcd(11 downto 8)

#### display_Mode_Select_Mux
- regA, regB, regG, regO
- sel
- clk

#### debounce
- button
- clk

#### clkDiv100to500
- clk_in

## Outputs

#### FSM output
- enable_A, enable_b, enable_C, enable_O 
- display_Mode

#### ALU output
- result

#### RegisterA
- opreand A

#### RegisterB
- opreand B

#### RegisterG
- opreand G

#### RegisterO
- opreand O

#### BIN2BCD
- BCD code

#### seg7 - U7
- bcd(3 downto 0)

#### seg7 - U8
- bcd(7 downto 4)

#### seg7 - U9
- bcd(11 downto 8)

#### display_Mode_Select_Mux
- led_out

#### debounce
- debounce_out

#### clkDiv100to500
- clk_out

## Buttons

#### Center
- Changes the state of the FSM and there are four states in total.

## Contributers
* Hassan Alhujhoj
* Abdullah Naeem 
* Jin Kim
