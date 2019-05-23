library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    port(opcode_in  : in STD_LOGIC_VECTOR(1 downto 0);
        clk         : in std_logic;
        A, B        : in std_logic_vector(7 downto 0);
        result      : out std_logic_vector(7 downto 0));
end ALU;

architecture Behav of ALU is
	begin
		acc : process (clk, opcode_in, A, B) is    
			begin
			    if (clk'event and clk = '1') then
                    case opcode_in is
                        when "00" => result <= A + B;
                        when "01" => result <= A - B;
                        when "10" => result <= A AND B;
                        when others => result <= A OR B;
                    end case;
				end if;
		end process acc;
end Behav;