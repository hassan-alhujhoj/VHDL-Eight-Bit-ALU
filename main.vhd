library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- This is a the main top level module of the project
ENTITY main IS 
    PORT(CLK100MHZ						: in STD_LOGIC;
		SW 								: in STD_LOGIC_VECTOR(7 downto 0);
		BTNC, BTNU, BTND, BTNR, BTNL 	: in STD_LOGIC;
        LED16_B                         : out std_logic;
        LED17_G                         : out std_logic;
		CA, CB, CC, CD, CE, CF, CG      : out STD_LOGIC;
		AN                              : out STD_LOGIC_VECTOR(7 downto 0); 
		LED 							: out STD_LOGIC_VECTOR(7 downto 0));
END main;

ARCHITECTURE BEHAVIOUR OF main is

    component seg7 is
        Port (bcd       : in STD_LOGIC_VECTOR (3 downto 0);
              seg7_out    : out STD_LOGIC_VECTOR(6 downto 0));
    end component;
    
    component ALU_8_bit is
        port(buttonU, buttonD, buttonR, buttonL   : in STD_LOGIC;
            clk                       : in std_logic;
            A, B                      : in std_logic_vector(7 downto 0);
            result                    : out std_logic_vector(7 downto 0));
	end component;

	component FSM is 
        port(A, B                 : in STD_LOGIC_VECTOR(7 downto 0);
            buttonC               : in STD_LOGIC;
            clk                   : in STD_LOGIC;
            operandA, operandB    : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	component regA is
	   	port(D 		: in std_logic_vector(7 downto 0);
            Clk  : in std_logic;
            Q         : out std_logic_vector(7 downto 0));
    end component;
    
    component regB is
        port(D         : in std_logic_vector(7 downto 0);
            Clk : in std_logic;
            Q         : out std_logic_vector(7 downto 0));
    end component;
    
    component regG is
        port(D         : in std_logic_vector(7 downto 0);
            Clk : in std_logic;
            Q         : out std_logic_vector(7 downto 0));
    end component;
    
    component BIN2BCD is
          port (BINARY    : in std_logic_vector(7 downto 0);  -- range 0 to 255
                BCD       : out std_logic_vector(11 downto 0));
    end component;
    
	component led_out is 
	   port(led_in : in std_logic_vector(7 downto 0);
            clk     : in std_logic;
            output  : out std_logic_vector(7 downto 0));
    end component;
    
    component clkDiv100to1 is 
	port(clk_in : in std_logic;
         clk_out   : out std_logic);
    end component;
    
    component seg7_mux is
        port(clk		: in std_logic;
            digit1        : in std_logic_vector(6 downto 0);
            digit2        : in std_logic_vector(6 downto 0);
            digit3        : in std_logic_vector(6 downto 0);
            anode        : out std_logic_vector(7 downto 0);
            cathode_out    : out std_logic_vector(6 downto 0));
    end component;
    
    component clkDiv100to500 is 
        port(clk_in : in std_logic;
             clk_out   : out std_logic);
    end component;
	
	signal regA_in_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal regB_in_wire : STD_LOGIC_VECTOR(7 downto 0);
    signal regA_out_wire : STD_LOGIC_VECTOR(7 downto 0);
    signal regB_out_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal regG_in_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal regG_out_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal bin_to_bcd_wire : STD_LOGIC_VECTOR(11 downto 0);
	signal anode : STD_LOGIC_VECTOR(7 downto 0);
	signal clkDiv_out_wire : STD_LOGIC;
	signal seg7_mux_wire1 : STD_LOGIC_VECTOR(6 downto 0);
	signal seg7_mux_wire2 : STD_LOGIC_VECTOR(6 downto 0);
	signal seg7_mux_wire3 : STD_LOGIC_VECTOR(6 downto 0);
	signal clkDiv100to500_wire : STD_LOGIC;

	BEGIN
		
		U1: FSM
			port map (A => SW, B => SW, buttonC => BTNC, clk => CLK100MHZ, operandA => regA_in_wire, operandB => regB_in_wire);
        U2: ALU_8_bit
            port map (buttonU => BTNU, buttonD => BTND, buttonL => BTNL, buttonR => BTNR, clk => CLK100MHZ,  A => regA_out_wire, B => regB_out_wire, result => regG_in_wire);
        U3: regA
            port map(D => regA_in_wire, Clk => CLK100MHZ, Q => regA_out_wire);
        U4: regB
            port map(D => regB_in_wire, Clk => CLK100MHZ, Q => regB_out_wire);
        U5: regG
            port map(D => regG_in_wire, Clk => CLK100MHZ, Q => regG_out_wire);
        U6: BIN2BCD
            port map(BINARY => regG_out_wire, BCD => bin_to_bcd_wire);
        U7: seg7
            port map(bcd => bin_to_bcd_wire(3 downto 0), seg7_out => seg7_mux_wire1);
        U8: seg7
            port map(bcd => bin_to_bcd_wire(7 downto 4), seg7_out => seg7_mux_wire2);
        U9: seg7
            port map(bcd => bin_to_bcd_wire(11 downto 8), seg7_out => seg7_mux_wire3);
        U10: led_out
            port map (led_in => regG_in_wire, clk => CLK100MHZ, output => LED);
        U11: clkDiv100to1
            port map(clk_in => CLK100MHZ, clk_out => LED16_B);
        U12: seg7_mux
            port map (clk => clkDiv100to500_wire, digit1 => seg7_mux_wire1, digit2 => seg7_mux_wire2, digit3 => seg7_mux_wire3, anode => AN, cathode_out(6) => CA, cathode_out(5) => CB, cathode_out(4) => CC, cathode_out(3) => CD, cathode_out(2) => CE, cathode_out(1) => CF, cathode_out(0) => CG);
        U13: clkDiv100to500
            port map (clk_in => CLK100MHZ, clk_out => clkDiv100to500_wire);
END BEHAVIOUR;