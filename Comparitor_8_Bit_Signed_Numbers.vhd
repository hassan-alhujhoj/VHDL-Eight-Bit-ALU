library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Comparitor_8_Bit_Signed_Numbers is
	port( A, B 				: in signed(7 downto 0);
		AeqB, AgtB, AltB	: out std_logic);
end Comparitor_8_Bit_Signed_Numbers;

architecture C12_Arch of Comparitor_8_Bit_Signed_Numbers is
	begin
		AeqB <= '1' WHEN A = B ELSE '0';
		AgtB <= '1' WHEN A > B ELSE '0';
		AltB <= '1' WHEN A < B ELSE '0';
end C12_Arch;