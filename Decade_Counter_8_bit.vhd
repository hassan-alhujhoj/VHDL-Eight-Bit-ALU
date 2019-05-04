library IEEE;                                                          --library definition 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all;

entity Counter_8_bit is                                                    --entity definition 
	port (clk	:in std_logic; 
		reset	: in std_logic; 
		q		: out std_logic_vector(3 downto 0)); 
end Counter_8_bit;

architecture Counter_8_bit of Counter is                         -- Architecture definition 
	begin 
	process(clk,reset)                                           -- Process definition 
		variable qtemp : std_logic_vector(3 downto 0);   -- temporary variable for output q[3..0] 
		begin 
			if reset = '1' then 
				qtemp := "0000";
				q <= "0000";                                           -- Reset asychroniously 
			elsif (clk'event and clk = '1') then                              -- Counting state 
				if qtemp < 9 then 
					qtemp:= qtemp + 1;                                         -- Counter increase 
				else 
					qtemp:= "0000";                                             -- Return the zero state  
				end if; 
				q <= qtemp;                                                      -- Output 
			end if; 
	end process;                                                      -- End Process 
end Counter1;                                                       -- End Architecture