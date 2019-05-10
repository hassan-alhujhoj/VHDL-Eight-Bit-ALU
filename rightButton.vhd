library ieee;
use ieee.std_logic_1164.all;

entity rightButton is
	port(buttonR: in STD_LOGIC;
		opcode: out STD_LOGIC_VECTOR(1 downto 0));
end rightButton;

Architecture behaviour of rightButton is
	begin
	process(buttonR)
	   begin
            if (rising_edge(buttonR)) then
                opcode <= "10";
            end if;
    end process;
end behaviour;