library ieee;
use ieee.std_logic_1164.all;

entity upButton is
	port(buttonU: in STD_LOGIC;
		opcode: out STD_LOGIC_VECTOR(1 downto 0));
end upButton;

Architecture behaviour of upButton is
	begin
	process(buttonU)
	   begin
            if (rising_edge(buttonU)) then
                opcode <= "00";
            end if;
    end process;
end behaviour;