library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_8_bit is
	port (buttonU, buttonD, buttonL, buttonR : in std_logic;
            clk     : in std_logic;
            A, B 	: in std_logic_vector(7 downto 0);
			result 	: out std_logic_vector(7 downto 0));
end ALU_8_bit;

architecture Behav of ALU_8_bit is
    signal operation : std_logic_vector(1 downto 0);
	begin
		acc : process (clk, buttonU, buttonD, buttonL, buttonR, A, B) is
			begin
			    if rising_edge(clk) then
                    if (buttonU = '1') then
                        operation <= "00";
                    end if;
                    if (buttonR  = '1') then
                        operation <= "10";
                    end if;
                    if (buttonD  = '1') then
                        operation <= "01";
                    end if;
                    if (buttonL  = '1') then
                        operation <= "11";
                    end if;
				case operation is
					when "00" => result <= A + B;
					when "01" => result <= A - B;
					when "10" => result <= A AND B;
					when others => result <= A OR B;
				end case;
				end if;
		end process acc;
end Behav;