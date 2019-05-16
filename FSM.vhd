library ieee;
use ieee.std_logic_1164.all;

-- Simple FSM moudle that changes the its state. There are four states: 
-- A = enter the value of the registerA,
-- B = enter the value of registerB, 
-- opcode = enter the opcode of registerO
-- Display_mode = output the state of the FSM
entity FSM is
    port(buttonC                                : in STD_LOGIC;
        clk                                     : in STD_LOGIC;
        enable_A, enable_B, enable_G, enable_O  : out STD_LOGIC;
        display_Mode                            : out STD_LOGIC_VECTOR(1 downto 0));
end FSM;

Architecture behaviour of FSM is
	type state_type is (s0, s1, s2, s3); 	-- four state machine
	signal current_s, next_s : state_type; 	-- current and next state declaration
	signal prev_button : std_logic;
	begin
        with current_s select display_Mode <=
            "00" when s0,
            "01" when s1,
            "10" when s2,
            "11" when s3;
        -- implement the state machine
        process(current_s)
            begin
              if rising_edge(clk) then
                  enable_A <= '0';
                  enable_B <= '0';
                  enable_O <= '0';
                  enable_G <= '0';
                case current_s is
                    when s0 => 				-- when current state is "s0"
                        if buttonC = '1' and prev_button = '0' then
                            enable_A <= '1';
                            enable_B <= '0';
                            enable_O <= '0';
                            enable_G <= '0';
                            current_s <= s1;
                        end if;
                    when s1 => 				-- when current state is "s1"
                        if buttonC = '1' and prev_button = '0' then
                            enable_A <= '0';
                            enable_B <= '1';
                            enable_O <= '0';
                            enable_G <= '0';
                            current_s <= s2;
                        end if;
                    when s2 => 				-- when current state is "s2"
                        if buttonC = '1' and prev_button = '0' then
                            enable_A <= '0';
                            enable_B <= '0';
                            enable_O <= '1';
                            enable_G <= '0';
                            current_s <= s3;
                        end if;
                    when s3 => 				-- when current state is "s3"
                        if buttonC = '1' and prev_button = '0' then
                            enable_A <= '0';
                            enable_B <= '0';
                            enable_O <= '0';
                            enable_G <= '1';
                            current_s <= s0;
                        end if;
                end case;
                prev_button <= buttonC;
            end if;
        end process;
end behaviour;
