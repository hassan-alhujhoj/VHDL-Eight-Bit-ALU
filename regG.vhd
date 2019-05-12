library ieee;
use ieee.std_logic_1164.all;


entity regG is
	generic (n 	: integer := 8);
	
	port(D 		: in std_logic_vector(n-1 downto 0);
		Clk, En : in std_logic;
		Q 		: out std_logic_vector(n-1 downto 0));
end regG;

architecture behaviour of regG is
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