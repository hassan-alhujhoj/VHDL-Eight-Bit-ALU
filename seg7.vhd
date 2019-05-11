LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY seg7 IS 
	PORT(bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		led : OUT STD_LOGIC_VECTOR(0 TO 6));
END seg7;

ARCHITECTURE BEHAVIOUR OF seg7 IS 
BEGIN
	PROCESS(bcd)
	BEGIN
		CASE bcd IS				--"abcdefg"
			WHEN "0000" => led <= "0000001";
			WHEN "0001" => led <= "1001111";
			WHEN "0010" => led <= "0010010";
			WHEN "0011" => led <= "0000110";
			WHEN "0100" => led <= "1001100";
			WHEN "0101" => led <= "0100100";
			WHEN "0110" => led <= "0100000";
			WHEN "0111" => led <= "0001111";
			WHEN "1000" => led <= "0000000";
			WHEN "1001" => led <= "0001100";
			WHEN OTHERS => led <= "-------";
		END CASE;
	END PROCESS;
END BEHAVIOUR;