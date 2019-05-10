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
		dataBus 						: in STD_LOGIC_VECTOR(7 downto 0);
		output 							: out STD_LOGIC_VECTOR(7 downto 0));
END main;

ARCHITECTURE BEHAVIOUR OF main is

    component ALU is
	port (buttonU, buttonD, buttonL, buttonR : in std_logic;
            clk     : in std_logic;
            A, B     : in std_logic_vector(7 downto 0);
            result     : out std_logic_vector(7 downto 0));
	end component;

	component FSM is 
		port(A, B		: in STD_LOGIC_VECTOR(7 downto 0);
			C			: in STD_LOGIC_VECTOR(1 downto 0);
			buttonC		: in STD_LOGIC;
			clk	: in STD_LOGIC;
			FSMout		: out STD_LOGIC);
	end component;
	
	signal reg0 : STD_LOGIC_VECTOR(7 downto 0);
	signal reg1 : STD_LOGIC_VECTOR(7 downto 0);
	signal opcode : STD_LOGIC_VECTOR(1 downto 0);

	BEGIN
		
		U1: FSM
			port map (A => reg0, B => reg1, C => opcode, buttonC => BTNC , clk => CLK100MHZ);
        U2: ALU
            port map (buttonU => BTNU, buttonD => BTND, buttonL => BTNL, buttonR => BTNR, clk => CLK100MHZ,  A => reg0, B => reg1);	
END BEHAVIOUR;