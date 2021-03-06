----------------------------------------------------------------------------------
-- Academic Institution: University of Canterbury. 
-- Engineer: Hassan Alhujhoj (haa61), Jin Su Kim (jsk71), Abdullah Naeem (ana104)
-- 
-- Create Date: 23.05.2019 12:16:15
-- Design Name: VHDL programming
-- Module Name: seg7 - behavioural
-- Project Name: ALU + FSM + REG Project
-- Target Devices: Nexys 4 DDR Artix-7 FPGA
-- Tool Versions: VHDL Vivado
-- Description: This module is used to display decimal number between 0 and 9 using a 4-bit BCD code.
-- 
-- Revision: Code has been revised by all three designers, Hassan A, Jin K, and Abdullah N (24/05/2019).

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seg7 is
    Port (bcd       : in STD_LOGIC_VECTOR (3 downto 0);
          seg7_out    : out STD_LOGIC_VECTOR(6 downto 0));
end seg7;

architecture behavioural of seg7 is
    signal segments_out : STD_LOGIC_VECTOR (6 downto 0);
    begin
        seven_segment_process: process(bcd)
            begin
                case bcd is                      --"abcdefg"
                    when "0000" => segments_out <= "0000001";   --0
                    when "0001" => segments_out <= "1001111";   --1
                    when "0010" => segments_out <= "0010010";   --2
                    when "0011" => segments_out <= "0000110";   --3
                    when "0100" => segments_out <= "1001100";   --4
                    when "0101" => segments_out <= "0100100";   --5
                    when "0110" => segments_out <= "0100000";   --6
                    when "0111" => segments_out <= "0001111";   --7
                    when "1000" => segments_out <= "0000000";   --8
                    when "1001" => segments_out <= "0000100";   --9
                    when others => segments_out <= "1111111";   
                end case;
            end process seven_segment_process; 
    seg7_out <= segments_out;
end behavioural;