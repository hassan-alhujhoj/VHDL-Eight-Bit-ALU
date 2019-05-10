library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- This is a the main top level module of the project
ENTITY main IS 
    PORT(CLK100MHZ						: in STD_LOGIC;
		SW 								: in STD_LOGIC_VECTOR(15 downto 0);
		LED 							: in STD_LOGIC_VECTOR(15 downto 0);
		BTNC, BTNU, BTND, BTNR, BTNL 	: in STD_LOGIC;
		opcode							: in STD_LOGIC_VECTOR(3 downto 0);
		dataBus 						: in STD_LOGIC_VECTOR(7 downto 0);
		output 							: out STD_LOGIC_VECTOR(7 downto 0));
END main;

ARCHITECTURE BEHAVIOUR OF main 

	component oprandA is
		port();
	end component;

	component operandB is
		port();
	end component;

	component reg0 is 
		port();
	end component;

	component reg1 is 
		port();
	end component;

	component ALU is 
		port();
	end component;

	component display is 
		port();
	end component;

	component FSM is 
		port();
	end component;

	component counter is
		port();
	end component;

	BEGIN
	
	opcode <= SW(15) & SW(14) & SW(13) & SW(12); -- This is the 4-bit opcode
	process()
		begin
	end process;
	
END BEHAVIOUR;