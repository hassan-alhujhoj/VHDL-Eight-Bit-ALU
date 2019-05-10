library ieee;
use ieee.std_logic_1164.all;
-- Simple FSM MODULE

entity simple_FSM_module is
	port(x, reset, clk 	: in STD_LOGIC;
		y 				: out STD_LOGIC);
end simple_FSM_module;

Architecture behaviour of simple_FSM_module is
	type state_type is (s0, s1, s2, s3); 	-- four state machine
	signal current_s, next_s : state_type; 	-- current and next state declaration
	
	begin
	
	process(clk, reset)
		begin
			if reset = '1' then
				current_s <= s0;			-- enter s0 state on reset.
			elsif rising_edge(clk) then
				current_s <= next_s;		-- instigate a state change.
			end if;
	end process;
	
	-- implement the state machine
	process(current_s, x)
		begin
			case current_s is
				when s0 => 				-- when current state is "s0"
					if(x = '0') then
						y <= '0';
						next_s <= s0;	-- only count when x is high
					else
						y <= '0';
						next_s <= s1;
					end if;
					
				when s1 => 				-- when current state is "s1"
					if(x = '0') then
						y <= '0';
						next_s <= s1;	-- only count when x is high
					else
						y <= '0';
						next_s <= s2;
					end if;
				
				when s2 => 				-- when current state is "s2"
					if(x = '0') then
						y <= '0';
						next_s <= s2;	-- only count when x is high
					else
						y <= '0';
						next_s <= s3;
					end if;
				
				when s3 => 				-- when current state is "s3"
					if(x = '0') then
						y <= '0';
						next_s <= s3;	-- only count when x is high
					else
						y <= '0';
						next_s <= s0;
					end if;
			end case;
	end process;
end behaviour;