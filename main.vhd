----------------------------------------------------------------------------------
-- Academic Institution: University of Canterbury. 
-- Engineer: Hassan Alhujhoj (haa61), Jin Su Kim (jsk71), Abdullah Naeem (ana104)
-- 
-- Create Date: 24.05.2019 13:02:01
-- Design Name: VHDL programming
-- Module Name: main - Structural
-- Project Name: ALU + FSM + REG Project
-- Target Devices: Nexys 4 DDR Artix-7 FPGA
-- Tool Versions: VHDL Vivado
-- Description: This Structural code implement an ALU that can perform add, subreact, bitwise AND, and bitwise OR operations using two 8-bit operands and output a 8-bit operand.
-- The ALU's opcode depends on the FSM enable values that is sent into each register. The input operand will be saved into register A and register B, and
-- the opcode will be saved to register O. The output operand of the ALU will be saved into register G. The FSM role is to its state using the central button.
-- The four states are enter operand A, enter operand B, enter opecode and finally display the mode of FSM. 
-- 
-- Revision: Code has been revised by all three designers, Hassan A, Jin K, and Abdullah N (24/05/2019).

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- This is a the main top level module of the project
ENTITY main IS 
    PORT(CLK100MHZ                            : in STD_LOGIC;
		SW 								      : in STD_LOGIC_VECTOR(7 downto 0);
		BTNC                                  : in STD_LOGIC;
		CA, CB, CC, CD, CE, CF, CG            : out STD_LOGIC;
		AN                                    : out STD_LOGIC_VECTOR(7 downto 0); 
		LED 							      : out STD_LOGIC_VECTOR(15 downto 0));
END main;

ARCHITECTURE Structural OF main is
	
	signal fsm_opcode_out_wire : STD_LOGIC_VECTOR(1 downto 0);
	signal fsm_display_mode_out_wire : STD_LOGIC_VECTOR(1 downto 0);	
	signal fsm_enableA_out_wire : STD_LOGIC;
	signal fsm_enableB_out_wire : STD_LOGIC;
	signal fsm_enableG_out_wire : STD_LOGIC;
	signal fsm_enableO_out_wire : STD_LOGIC;
	signal regA_in_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal regA_out_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal regA_state_wire : STD_LOGIC;
    signal regB_in_wire : STD_LOGIC_VECTOR(7 downto 0);
    signal regB_out_wire : STD_LOGIC_VECTOR(7 downto 0);
    signal regB_state_wire : STD_LOGIC;
	signal regG_in_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal regG_out_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal regG_state_wire : STD_LOGIC;
	signal regO_in_wire : STD_LOGIC_VECTOR(1 downto 0);
	signal regO_out_wire : STD_LOGIC_VECTOR(1 downto 0);
	signal regO_state_wire : STD_LOGIC;
	signal bin_to_bcd_wire : STD_LOGIC_VECTOR(11 downto 0);
	signal anode : STD_LOGIC_VECTOR(7 downto 0);
	signal seg7_mux_wire1 : STD_LOGIC_VECTOR(6 downto 0);
	signal seg7_mux_wire2 : STD_LOGIC_VECTOR(6 downto 0);
	signal seg7_mux_wire3 : STD_LOGIC_VECTOR(6 downto 0);
	signal clkDiv100to500_wire : STD_LOGIC;
	signal debounce_clk_in_wire : STD_LOGIC;
	signal debounce_button_out_wire : STD_LOGIC;

	BEGIN
		U1: entity work.FSM
			port map (buttonC => debounce_button_out_wire, clk => CLK100MHZ, enable_A => fsm_enableA_out_wire, enable_B => fsm_enableB_out_wire, enable_G => fsm_enableG_out_wire, enable_O => fsm_enableO_out_wire, display_Mode => fsm_display_mode_out_wire);
        U2: entity work.ALU
            port map (opcode_in => regO_out_wire, clk => CLK100MHZ,  A => regA_out_wire, B => regB_out_wire, result => regG_in_wire);
        U3: entity work.regA
            port map(D => SW(7 downto 0), Clk => CLK100MHZ, enable => fsm_enableA_out_wire, Q => regA_out_wire);
        U4: entity work.regB
            port map(D => SW(7 downto 0), Clk => CLK100MHZ, enable => fsm_enableB_out_wire, Q => regB_out_wire);
        U5: entity work.regG
            port map(D => regG_in_wire, Clk => CLK100MHZ, enable => fsm_enableG_out_wire, Q => regG_out_wire);
        U6: entity work.regO
            port map(D => SW(1 downto 0), Clk => CLK100MHZ, enable => fsm_enableO_out_wire, Q => regO_out_wire);
        U7: entity work.BIN2BCD
            port map(BINARY => regG_out_wire, BCD => bin_to_bcd_wire);
        U8: entity work.seg7
            port map(bcd => bin_to_bcd_wire(3 downto 0), seg7_out => seg7_mux_wire1);
        U9: entity work.seg7
            port map(bcd => bin_to_bcd_wire(7 downto 4), seg7_out => seg7_mux_wire2);
        U10: entity work.seg7
            port map(bcd => bin_to_bcd_wire(11 downto 8), seg7_out => seg7_mux_wire3);
        U11: entity work.display_Mode_Select_Mux
            port map (regA => regA_out_wire, regB => regB_out_wire, regG => regG_out_wire, regO => regO_out_wire, sel => fsm_display_mode_out_wire, led_out => LED(7 downto 0), state_out => LED(15 downto 14));
        U12: entity work.clkDiv100to500
            port map(clk_in => CLK100MHZ, clk_out => debounce_clk_in_wire);
        U13: entity work.seg7_mux
            port map (clk => clkDiv100to500_wire, digit1 => seg7_mux_wire1, digit2 => seg7_mux_wire2, digit3 => seg7_mux_wire3, anode => AN, cathode_out(6) => CA, cathode_out(5) => CB, cathode_out(4) => CC, cathode_out(3) => CD, cathode_out(2) => CE, cathode_out(1) => CF, cathode_out(0) => CG);
        U14: entity work.clkDiv100to500
            port map (clk_in => CLK100MHZ, clk_out => clkDiv100to500_wire);
        U15: entity work.debounce
            port map(button => BTNC, clk => debounce_clk_in_wire, debounce_out => debounce_button_out_wire);
END Structural;