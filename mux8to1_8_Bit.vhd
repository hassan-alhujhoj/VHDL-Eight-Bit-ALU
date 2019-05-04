LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- This is a 8-bit mux8to1
ENTITY mux8to1_8_Bit IS 
    PORT(A, B, C, D, E, F, G, H	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Sel       				: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        Output     				: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END mux8to1_8_Bit;

ARCHITECTURE BEHAVIOUR OF mux8to1_8_Bit IS

BEGIN
	WITH Sel SELECT
		Output <= 	A WHEN "000",
					B WHEN "001",
					C WHEN "010",
					D WHEN "011",
					E WHEN "100",
					F WHEN "101",
					G WHEN "110",
					H WHEN OTHERS;
END BEHAVIOUR;