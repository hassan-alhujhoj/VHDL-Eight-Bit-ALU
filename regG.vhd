----------------------------------------------------------------------------------
-- Academic Institution: University of Canterbury. 
-- Engineer: Hassan Alhujhoj (haa61), Jin Su Kim (jsk71), Abdullah Naeem (ana104)
-- 
-- Create Date: 23.05.2019 15:15:15
-- Design Name: VHDL programming
-- Module Name: regG - behavioural
-- Project Name: ALU + FSM + REG Project
-- Target Devices: Nexys 4 DDR Artix-7 FPGA
-- Tool Versions: VHDL Vivado
-- Description: This module is a register that saves an 8-bit binary number at a rising edge of the clock and after the enable is equal
-- to one. Otherwise, if enable = 0, no operand is saved.
-- 
-- Revision: Code has been revised by all three designers, Hassan A, Jin K, and Abdullah N (24/05/2019).

----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity regG is
	generic (n 	      : integer := 8);
    port(D            : in std_logic_vector(n-1 downto 0);
        Clk           : in std_logic;
        enable        : in std_logic;
        Q             : out std_logic_vector(n-1 downto 0));
end regG;


architecture behavioural of regG is
	begin
	process(Clk)
		begin
			if rising_edge(Clk) then
                if enable = '1' then
                    Q <= D;
                end if;
            end if;
	end process;
end behavioural;