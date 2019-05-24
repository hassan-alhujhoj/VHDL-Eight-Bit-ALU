----------------------------------------------------------------------------------
-- Academic Institution: University of Canterbury. 
-- Engineer: Hassan Alhujhoj (haa61), Jin Su Kim (jsk71), Abdullah Naeem (ana104)
-- 
-- Create Date: 23.05.2019 12:16:15
-- Design Name: VHDL programming
-- Module Name: display_Mode_Select_Mux - behavioural
-- Project Name: ALU + FSM + REG Project
-- Target Devices: Nexys 4 DDR Artix-7 FPGA
-- Tool Versions: VHDL Vivado
-- Description: This module is mux that selects the output state of the FSM using a 2-bit select code that is sent from the FSM to this 
-- module. The output of this module is then sent into the LEDs on the Artix-7 FPGA board.
-- 
-- Revision: Code has been revised by all three designers, Hassan A, Jin K, and Abdullah N (24/05/2019).

----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity display_Mode_Select_Mux is
	   port(regA, regB, regG	: in std_logic_vector(7 downto 0);
            regO                : in std_logic_vector(1 downto 0);
            sel                 : in std_logic_vector(1 downto 0);
            led_out             : out std_logic_vector(7 downto 0);
            state_out           : out std_logic_vector(1 downto 0));
end display_Mode_Select_Mux;

architecture behavioural of display_Mode_Select_Mux is
	begin
	state_out <= sel;
    process (sel, regA, regB, regG, regO)
    begin
        case sel is
            when "00" => led_out <= regA;
            when "01" => led_out <= regB;
            when "10" => led_out <= "000000" & regO;
            when others => led_out <= regG;
        end case;
    end process;
end behavioural;