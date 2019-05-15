library ieee;
use ieee.std_logic_1164.all;


entity regO is
	generic (n 	      : integer := 2);
    port(D            : in std_logic_vector(n-1 downto 0);
        Clk           : in std_logic;
        enable        : in std_logic;
        state         : out std_logic;
        Q             : out std_logic_vector(n-1 downto 0));
end regO;


architecture behaviour of regO is
	begin
	process(Clk)
		begin
			if rising_edge(Clk) then
                if enable = '1' then
                    Q <= D;
                    state <= '1';
                elsif enable = '0' then
                    state <= '0';
                end if;
            end if;
	end process;
end behaviour;