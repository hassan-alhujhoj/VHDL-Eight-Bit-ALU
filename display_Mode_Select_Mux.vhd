library ieee;
use ieee.std_logic_1164.all;


entity display_Mode_Select_Mux is
	   port(regA, regB, regG	: in std_logic_vector(7 downto 0);
            regO                : in std_logic_vector(1 downto 0);
            sel                 : in std_logic_vector(1 downto 0);
            led_out             : out std_logic_vector(7 downto 0));
end display_Mode_Select_Mux;

architecture behaviour of display_Mode_Select_Mux is
	begin
    process (sel, regA, regB, regG, regO)
    begin
        case sel is
            when "00" => led_out <= regA;
            when "01" => led_out <= regB;
            when "10" => led_out <= "000000" & regO;
            when others => led_out <= regG;
        end case;
    end process;
end behaviour;