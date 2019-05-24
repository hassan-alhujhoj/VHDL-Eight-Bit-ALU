----------------------------------------------------------------------------------
-- Academic Institution: University of Canterbury. 
-- Engineer: Hassan Alhujhoj (haa61), Jin Su Kim (jsk71), Abdullah Naeem (ana104)
-- 
-- Create Date: 22.05.2019 19:16:39
-- Design Name: VHDL programming
-- Module Name: clkDiv100to500 - behavioural
-- Project Name: ALU + FSM + REG Project
-- Target Devices: Nexys 4 DDR Artix-7 FPGA
-- Tool Versions: VHDL Vivado
-- Description: This module is a clock divider that divides 100MHZ clock signal into 500 HZ clock signal using a simple counter.
-- 
-- Revision: Code has been revised by all three designers, Hassan A, Jin K, and Abdullah N (24/05/2019).

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--A clk divider that divides a 100MHz clk to 500 HZ and shows that output on LED16_R
entity clkDiv100to500 is 
	port(clk_in : in std_logic;
		 clk_out   : out std_logic);
end clkDiv100to500;

architecture behavioural of clkDiv100to500 is
	signal count : INTEGER := 1;
	signal clock_out : STD_LOGIC := '0';
begin								-- generates a 1Hz clk_out from a 100MHz clk_in.
	process(clk_in)
		begin
			 if (clk_in'event and clk_in = '1') then
				count <= count + 1;
				if(count = 100000) then           -- if counter == 50,000,000 gives 1 Hz. So, if we divide by 50000000 / 500 we git 100000 which gives us a 500hz output.
					clock_out <= not clock_out;     --  toggle clock
				    count <= 1;                         --  reset counter
				end if;
			end if;
	end process;
end behavioural;