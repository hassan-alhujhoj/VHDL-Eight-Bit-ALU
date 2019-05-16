library ieee;
use ieee.std_logic_1164.all;

entity regB is
	generic (n 	      : integer := 8);
    port(D            : in std_logic_vector(n-1 downto 0);
        Clk           : in std_logic;
        enable        : in std_logic;
        Q             : out std_logic_vector(n-1 downto 0));
end regB;

architecture behaviour of regB is
	begin
	process(Clk)
		begin
			if rising_edge(Clk) then
                if enable = '1' then
                    Q <= D;
                end if;
            end if;
	end process;
end behaviour;