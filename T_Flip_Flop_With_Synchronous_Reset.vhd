library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_Flip_Flop_With_Synchronous_Reset is
  Port (Clk, D, T, Reset  : in STD_LOGIC;
        Q   : out STD_LOGIC);
end T_Flip_Flop_With_Synchronous_Reset;

architecture Behavioral of T_Flip_Flop_With_Synchronous_Reset is
begin
	process(Clk, D, T, Reset)
		begin
			if(Clk'event and Clk = '1') then
				if Reset = '0' then
					Q <= '0';
				elsif(T = '0') then     -- if the control signal T = 0
					Q <= D;             -- toggle the state Q
				end if;
			end if;
	end process;
end Behavioral;
