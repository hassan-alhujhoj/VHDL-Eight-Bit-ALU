----------------------------------------------------------------------------------
-- Academic Institution: University of Canterbury. 
-- Engineer: Hassan Alhujhoj (haa61), Jin Su Kim (jsk71), Abdullah Naeem (ana104)
-- 
-- Create Date: 22.05.2019 10:49:33
-- Design Name: VHDL programming
-- Module Name: seg7_mux - behavioural
-- Project Name: ALU + FSM + REG Project
-- Target Devices: Nexys 4 DDR Artix-7 FPGA
-- Tool Versions: VHDL Vivado
-- Description: This module is mux that selects the the digit of the 8-bit operand. The 8-bit operand can go up to 255, for example,
-- where 2 is digit1, 5 is digit2, and 5 is digit3. Futhermore, this mux select the anodes and cathodes.
-- 
-- Revision: Code has been revised by all three designers, Hassan A, Jin K, and Abdullah N (24/05/2019).

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seg7_mux is
	port(clk		: in std_logic;
		digit1		: in std_logic_vector(6 downto 0);
		digit2		: in std_logic_vector(6 downto 0);
		digit3		: in std_logic_vector(6 downto 0);
		anode		: out std_logic_vector(7 downto 0);
		cathode_out	: out std_logic_vector(6 downto 0));
end seg7_mux;

architecture behavioural of seg7_mux is
	begin
		process(clk, digit1, digit2, digit3)
			variable counter : INTEGER := 0;
			begin
				if(clk'event and clk = '1') then
                    if counter = 0 then
                        cathode_out <= digit1;
                        anode <= "11111110";
                        counter := counter + 1;
                    elsif counter = 1 then
                        cathode_out <= digit2;
                        anode <= "11111101";
                        counter := counter + 1;
                    elsif counter = 2 then
                        cathode_out <= digit3;
                        anode <= "11111011";
                        counter := counter - 2;
                    end if;
                end if;
		end process;				
end behavioural;