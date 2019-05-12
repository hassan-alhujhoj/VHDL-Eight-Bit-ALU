library ieee;
use ieee.std_logic_1164.all;


entity regA is
	generic (n 	: integer := 8);
	
	port(D 		: in std_logic_vector(n-1 downto 0);
		Clk, En : in std_logic;
		Q 		: out std_logic_vector(n-1 downto 0));
end regA;

architecture behaviour of regA is
	begin
	process(Clk)
		begin
			if Clk'event and Clk = '1' then
				if En = '1' then
					Q <= D;
				end if;
			end if;
	end process;
end behaviour;