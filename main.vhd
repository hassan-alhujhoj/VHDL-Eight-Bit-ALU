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
		opcode							: in STD_LOGIC_VECTOR(2 downto 0);
		dataBus 						: in STD_LOGIC_VECTOR(7 downto 0);
		output 							: out STD_LOGIC_VECTOR(7 downto 0));
END main;

ARCHITECTURE BEHAVIOUR OF main 

	component ALU is 
	   port (operation : in std_logic_vector (1 downto 0);
			A, B 	: in std_logic_vector(7 downto 0);
			result 	: out std_logic_vector(7 downto 0));
	end component;

	component FSM is 
		port(A, B		: in STD_LOGIC_VECTOR(7 downto 0);
			C			: in STD_LOGIC_VECTOR(1 downto 0);
			buttonC		: in STD_LOGIC;
			reset, clk	: in STD_LOGIC;
			FSMout		: out STD_LOGIC);
	end component;

	component upButton is
		port(buttonU: in STD_LOGIC;
			opcode: out STD_LOGIC_VECTOR(1 downto 0));
	end component;
	
		component rightButton is
		port(buttonR: in STD_LOGIC;
			opcode: out STD_LOGIC_VECTOR(1 downto 0));
	end component;
	
		component downButton is
		port(buttonD: in STD_LOGIC;
			opcode: out STD_LOGIC_VECTOR(1 downto 0));
	end component;
	
		component leftButton is
		port(buttonL: in STD_LOGIC;
			opcode: out STD_LOGIC_VECTOR(1 downto 0));
	end component;
	
	signal reg0 : STD_LOGIC_VECTOR(7 downto 0);
	signal reg1 : STD_LOGIC_VECTOR(7 downto 0);
	signal opcode : STD_LOGIC_VECTOR(1 downto 0);

	BEGIN
		process()
			begin
		end process;
		
		U1: FSM
			port map (reg0 => A, reg1 => B, opcode => C, BTNC => buttonC, CLK100MHZ => clk);
		
END BEHAVIOUR;