library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity seg7_mux is
	port(clk		: in std_logic;
		digit1		: in std_logic_vector(6 downto 0);
		digit2		: in std_logic_vector(6 downto 0);
		digit3		: in std_logic_vector(6 downto 0);
		anode		: out std_logic_vector(7 downto 0);
		cathode_out	: out std_logic_vector(6 downto 0));
end seg7_mux;

architecture behaviour of seg7_mux is
	begin
		process(clk, digit1, digit2, digit3)
			variable counter : INTEGER := 0;
			begin
				if(clk'event and clk = '1') then
                    if counter = 0 then
                        cathode_out <= digit1;
                        anode <= "11111110";
                        counter := counter + 1;
				    elsif counter = 1 then
                        cathode_out <= "0000000";
                        anode <= "11111110";
                        counter := counter + 1;
                    elsif counter = 2 then
                        cathode_out <= digit2;
                        anode <= "11111101";
                        counter := counter + 1;
                    elsif counter = 3 then
                        cathode_out <= "0000000";
                        anode <= "11111101";
                        counter := counter + 1;
                    elsif counter = 4 then
                        cathode_out <= digit3;
                        anode <= "11111011";
                        counter := counter + 1;
                    elsif counter = 5 then
                        cathode_out <= "0000000";
                        anode <= "11111011";
                        counter := counter -5;
                    end if;
                end if;
		end process;				
end behaviour;