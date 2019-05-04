library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This file control which anode is being turned on or off
entity anode is
    Port ( an_in : in STD_LOGIC_VECTOR (3 downto 0);
           an_out : out STD_LOGIC_VECTOR (7 downto 0));
end anode;

architecture Behavioral of anode is
begin
    an_process: process(an_in) 
    begin
    case an_in is
    when "0001" => an_out <= "11111110";
    when "0010" => an_out <= "11111101";
    when "0011" => an_out <= "11111011";
    when "0100" => an_out <= "11110111";
    when "0101" => an_out <= "11101111";
    when "0110" => an_out <= "11011111";
    when "0111" => an_out <= "10111111";
    when "1000" => an_out <= "01111111";
    when others => an_out <= "11111111";   
    end case;
    end process an_process;
end Behavioral;
