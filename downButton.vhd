library ieee;
use ieee.std_logic_1164.all;

entity downButton is
	port(buttonD: in STD_LOGIC;
		opcode: out STD_LOGIC_VECTOR(1 downto 0));
end downButton;

Architecture behaviour of downButton is
	begin
	process(buttonD)
	   begin
            if (rising_edge(buttonD)) then
                opcode <= "01";
            end if;
    end process;
end behaviour;