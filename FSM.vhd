library ieee;
use ieee.std_logic_1164.all;

-- Simple FSM moudle that changes the its state. There are two states: 
-- A = enter the value of the register 0,
-- B = enter the value of register 1, 
entity FSM is
	port(A, B                 : in STD_LOGIC_VECTOR(7 downto 0);
        buttonC               : in STD_LOGIC;
		reset, clk                   : in STD_LOGIC;
		operandA, operandB    : out STD_LOGIC_VECTOR(7 downto 0));
end FSM;

Architecture behaviour of FSM is
	
	type state_type is (s0, s1); 	-- two state machine
	signal current_s, next_s : state_type; 	-- current and next state declaration
	
	begin
	
	process
        begin
            if reset = '1' then
                current_s <= s0;
            elsif rising_edge(clk) then
                current_s <= next_s;
            end if;
    end process;
	
	--implement the finite state machine
	process(current_s, A, B)
		begin
			case current_s is
				when s0 => 				-- when current state is "s0"
					if(buttonC = '0') then
						operandA <= A;
						next_s <= s0;	-- only count when buttonC is high
					elsif (buttonC = '1') then
						operandB <= B;
						next_s <= s1;
					end if;
					
				when s1 => 				-- when current state is "s1"
					if(buttonC = '0') then
						operandB <= B;
						next_s <= s1;	-- only count when buttonC is high
					elsif (buttonC = '1') then
						operandA <= A;
						next_s <= s0;
					end if;
            end case;
	end process;
end behaviour;