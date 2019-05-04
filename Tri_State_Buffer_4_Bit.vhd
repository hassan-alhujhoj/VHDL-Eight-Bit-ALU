library ieee;
use ieee.std_logic_1164.all;

-- VHDL code for an 8-bit tristate buffer
entity Tri_State_Buffer_4_Bit is
	generic (n : integer := 8);
	
	port(X 	: in std_logic_vector(n-1 downto 0);
		En 	: in std_logic;
		F 	: out std_logic_vector(n-1 downto 0));
end Tri_State_Buffer_4_Bit;

architecture behaviour of Tri_State_Buffer_4_Bit is
begin
	F <= (others =>'Z') when En = '0' else X;
end behaviour;