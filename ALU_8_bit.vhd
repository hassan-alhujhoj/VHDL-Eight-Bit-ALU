library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_8_bit is
	port (operation : in std_logic_vector (1 downto 0);
			A, B 	: in std_logic_vector(7 downto 0);
			result 	: out std_logic_vector(7 downto 0));
end ALU_8_bit;

architecture Behav of ALU_8_bit is
	begin
		acc : process (operation, A, B) is
			begin
				case operation is
					when "00" => result <= A AND B;
					when "01" => result <= A OR B;
					when "10" => result <= A + B;
					when others => result <= A - B;
				end case;
		end process acc;
end Behav;