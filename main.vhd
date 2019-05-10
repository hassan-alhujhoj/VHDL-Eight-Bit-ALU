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
		reset                           : in STD_LOGIC;
		dataBus 						: in STD_LOGIC_VECTOR(7 downto 0);
		output 							: out STD_LOGIC_VECTOR(7 downto 0));
END main;

ARCHITECTURE BEHAVIOUR OF main is

    component ALU_8_bit is
        port (buttonU, buttonD, buttonL, buttonR : in std_logic;
                clk     : in std_logic;
                A, B     : in std_logic_vector(7 downto 0);
                result     : out std_logic_vector(7 downto 0));
	end component;

	component FSM is 
        port(A, B                 : in STD_LOGIC_VECTOR(7 downto 0);
            buttonC               : in STD_LOGIC;
            reset, clk            : in STD_LOGIC;
            operandA, operandB    : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	component operandA is
	   	port(D 		: in std_logic_vector(7 downto 0);
            Clk, En : in std_logic;
            Q         : out std_logic_vector(7 downto 0));
    end component;
    
    component operandB is
        port(D         : in std_logic_vector(7 downto 0);
            Clk, En : in std_logic;
            Q         : out std_logic_vector(7 downto 0));
    end component;
    
    component operandG is
        port(D         : in std_logic_vector(7 downto 0);
            Clk, En : in std_logic;
            Q         : out std_logic_vector(7 downto 0));
    end component;
	
	signal reg0 : STD_LOGIC_VECTOR(7 downto 0);
	signal reg1 : STD_LOGIC_VECTOR(7 downto 0);
	signal opcode : STD_LOGIC_VECTOR(1 downto 0);

	BEGIN
		
		U1: FSM
			port map (A => reg0, B => reg1, buttonC => BTNC ,reset => reset, clk => CLK100MHZ);
        U2: ALU_8_bit
            port map (buttonU => BTNU, buttonD => BTND, buttonL => BTNL, buttonR => BTNR, clk => CLK100MHZ,  A => reg0, B => reg1);
        U3: operandA
            port map(D => reg0, Clk => CLK100MHZ, En => '0');
        U4: operandB
            port map(D => reg0, Clk => CLK100MHZ, En => '0');
        U5: operandG
            port map(D => reg0, Clk => CLK100MHZ, En => '0');
END BEHAVIOUR;