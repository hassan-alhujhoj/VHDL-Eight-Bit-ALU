library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Simple FSM moudle that changes the its state. There are four states: 
-- A = enter the value of the registerA,
-- B = enter the value of registerB, 
-- opcode = enter the opcode of registerO
-- Display_mode = output the state of the FSM
entity FSM is
	port(buttonC                                        : in STD_LOGIC;
    clk                                                 : in STD_LOGIC;
    enable_A, enable_B, enable_G, enable_O, enable_ALU  : out STD_LOGIC;
    display_Mode                                        : out STD_LOGIC_VECTOR(1 downto 0);
    state_1_led_out                                     : out STD_LOGIC;
    state_2_led_out                                     : out STD_LOGIC;
    state_3_led_out                                     : out STD_LOGIC;
    state_4_led_out                                     : out STD_LOGIC);
end FSM;

Architecture behaviour of FSM is
	begin
	--implement the finite state machine
	process(buttonC, clk)	
        variable counter : INTEGER := 0;
        begin
            if clk'event and clk = '1' then
                if buttonC = '1' then 
                    counter := counter + 1;
                    if counter = 4 then
                        counter := 0;
                    end if;
                end if;
            end if;
            if counter = 0 then 
                enable_A <= '1';
                enable_B <= '0';
                enable_O <= '0';
                enable_G <= '0';
                display_Mode <= "00";
            elsif counter = 1 then
                enable_A <= '0';
                enable_B <= '1';
                enable_O <= '0';
                enable_G <= '0';
                display_Mode <= "01";
            elsif counter = 2 then
                enable_A <= '0';
                enable_B <= '0';
                enable_O <= '1';
                enable_G <= '0';
                display_Mode <= "10";
            elsif counter = 3 then
                enable_A <= '0';
                enable_B <= '0';
                enable_O <= '0';
                enable_G <= '1';
                enable_ALU <= '1';
                display_Mode <= "11";
            end if;
	end process;
end behaviour;