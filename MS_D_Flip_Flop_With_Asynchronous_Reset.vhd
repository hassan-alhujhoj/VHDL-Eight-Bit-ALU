library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This is a master slave flip flop with a synchronous flip flop
entity MS_D_Flip_Flop_With_Asynchronous_Reset is
  Port (Clk, D, Reset  : in STD_LOGIC;
        Q       : out STD_LOGIC);
end MS_D_Flip_Flop_With_Asynchronous_Reset;

architecture Behavioral of MS_D_Flip_Flop_With_Asynchronous_Reset is
begin
	process(D, Clk)
		begin
			if(Reset = '0') then
				Q <= '0';
			elsif(Clk'event and Clk = '0') then
				Q <= D;
			end if;
	end process;
end Behavioral;
