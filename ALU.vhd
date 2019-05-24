----------------------------------------------------------------------------------
-- Academic Institution: University of Canterbury. 
-- Engineer: Hassan Alhujhoj (haa61), Jin Su Kim (jsk71), Abdullah Naeem (ana104)
-- 
-- Create Date: 24.05.2019 13:02:01
-- Design Name: VHDL programming
-- Module Name: ALU - behavioural
-- Project Name: ALU + FSM + REG Project
-- Target Devices: Nexys 4 DDR Artix-7 FPGA
-- Tool Versions: VHDL Vivado
-- Description: This module implement an 8-bit ALU using a 2-bit opcode. This ALU is capable of performing four operations add, subtract,
-- bitwise AND, and bitwise OR.
-- 
-- Revision: Code has been revised by all three designers, Hassan A, Jin K, and Abdullah N (24/05/2019).

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    port(opcode_in  : in STD_LOGIC_VECTOR(1 downto 0);
        clk         : in std_logic;
        A, B        : in std_logic_vector(7 downto 0);
        result      : out std_logic_vector(7 downto 0));
end ALU;

architecture behavioural of ALU is
	begin
		acc : process (clk, opcode_in, A, B) is    
			begin
			    if (clk'event and clk = '1') then
                    case opcode_in is
                        when "00" => result <= A + B;   -- When opcode is "00" do addition
                        when "01" => result <= A - B;   -- When opcode is "01" do subtraction
                        when "10" => result <= A AND B; -- When opcode is "10" do bitwise AND
                        when others => result <= A OR B;    -- When opcode is "11" do bitwise OR
                    end case;
				end if;
		end process acc;
end behavioural;