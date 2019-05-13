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
	port(A, B                 : in STD_LOGIC_VECTOR(7 downto 0);
	    opcode_in             : in STD_LOGIC_VECTOR(1 downto 0);
        buttonC               : in STD_LOGIC;
        clk                   : in STD_LOGIC;
		operandA, operandB    : out STD_LOGIC_VECTOR(7 downto 0);
		opcode_out            : out STD_LOGIC_VECTOR(1 downto 0);
		display_Mode          : out STD_LOGIC_VECTOR(1 downto 0));
end FSM;

Architecture behaviour of FSM is

	begin
	
	--implement the finite state machine
	process(A, B)	
        variable counter : INTEGER := 0;
        begin
            if clk'event and clk = '1' then
                if buttonC = '1' then 
                    counter := counter + 1;
                    if counter = 2 then
                        counter := 0;
                    end if;
                end if;
            end if;
            if counter = 0 then 
                operandA <= A;
                display_Mode <= "00";
            elsif counter = 1 then
                operandB <= B;
            end if;
	end process;
end behaviour;