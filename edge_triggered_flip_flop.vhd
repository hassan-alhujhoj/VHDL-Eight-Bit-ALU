library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity edge_triggered_flip_flop is
  Port (Clk, D  : in STD_LOGIC;
        Q       : out STD_LOGIC);
end edge_triggered_flip_flop;

architecture Behavioral of edge_triggered_flip_flop is
begin
	process(D, Clk)
		begin
			if(Clk'event and Clk = '1') then
				Q <= D;
			end if;
	end process;
end Behavioral;
