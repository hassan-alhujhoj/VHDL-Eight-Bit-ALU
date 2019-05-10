library ieee;
use ieee.std_logic_1164.all;

entity leftButton is
	port(buttonL: in STD_LOGIC;
		opcode: out STD_LOGIC_VECTOR(1 downto 0));
end leftButton;

Architecture behaviour of leftButton is
	begin
	process(buttonL)
	   begin
            if (rising_edge(buttonL)) then
                opcode <= "11";
            end if;
    end process;
end behaviour;