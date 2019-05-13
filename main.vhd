library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- This is a the main top level module of the project
ENTITY main IS 
    PORT(CLK100MHZ						: in STD_LOGIC;
		SW 								: in STD_LOGIC_VECTOR(7 downto 0);
		BTNC                            : in STD_LOGIC;
		CA, CB, CC, CD, CE, CF, CG      : out STD_LOGIC;
		AN                              : out STD_LOGIC_VECTOR(7 downto 0); 
		LED 							: out STD_LOGIC_VECTOR(7 downto 0));
END main;

ARCHITECTURE BEHAVIOUR OF main is

    component seg7 is
        Port (bcd       : in STD_LOGIC_VECTOR (3 downto 0);
              seg7_out    : out STD_LOGIC_VECTOR(6 downto 0));
    end component;
    
    component ALU is
        port(opcode_in  : in STD_LOGIC_VECTOR(1 downto 0);
            clk         : in std_logic;
            A, B        : in std_logic_vector(7 downto 0);
            result      : out std_logic_vector(7 downto 0));
	end component;

	component FSM is 
        port(A, B                 : in STD_LOGIC_VECTOR(7 downto 0);
            opcode_in             : in STD_LOGIC_VECTOR(1 downto 0);
            buttonC               : in STD_LOGIC;
            clk                   : in STD_LOGIC;
            operandA, operandB    : out STD_LOGIC_VECTOR(7 downto 0);
            operandO              : out STD_LOGIC_VECTOR(1 downto 0);
            display_Mode          : out STD_LOGIC_VECTOR(1 downto 0));
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
    
    component regO is
        port(D         : in std_logic_vector(1 downto 0);
            Clk : in std_logic;
            Q         : out std_logic_vector(1 downto 0));
    end component;
    
    component BIN2BCD is
          port (BINARY    : in std_logic_vector(7 downto 0);  -- range 0 to 255
                BCD       : out std_logic_vector(11 downto 0));
    end component;
    
    component display_Mode_Select_Mux is
	   port(regA, regB, regG	: in std_logic_vector(7 downto 0);
         regO                : in std_logic_vector(1 downto 0);
         sel                 : in std_logic_vector(1 downto 0);
         clk                 : in std_logic;
         led_out             : out std_logic_vector(7 downto 0));
    end component;
    
    component seg7_mux is
        port(clk		: in std_logic;
            digit1        : in std_logic_vector(6 downto 0);
            digit2        : in std_logic_vector(6 downto 0);
            digit3        : in std_logic_vector(6 downto 0);
            anode        : out std_logic_vector(7 downto 0);
            cathode_out    : out std_logic_vector(6 downto 0));
    end component;
    
    component debounce is
        Port(button         : in STD_LOGIC;
            clk             : in STD_LOGIC;
            debounce_out    : out STD_LOGIC);
    end component;
    
    component clkDiv100to500 is 
        port(clk_in : in std_logic;
             clk_out   : out std_logic);
    end component;
	
	signal fsm_opcode_out_wire : STD_LOGIC_VECTOR(1 downto 0);
	signal fsm_display_mode_out_wire : STD_LOGIC_VECTOR(1 downto 0);
	signal regA_in_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal regB_in_wire : STD_LOGIC_VECTOR(7 downto 0);
    signal regA_out_wire : STD_LOGIC_VECTOR(7 downto 0);
    signal regB_out_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal regG_in_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal regG_out_wire : STD_LOGIC_VECTOR(7 downto 0);
	signal regO_in_wire : STD_LOGIC_VECTOR(1 downto 0);
	signal regO_out_wire : STD_LOGIC_VECTOR(1 downto 0);
	signal bin_to_bcd_wire : STD_LOGIC_VECTOR(11 downto 0);
	signal anode : STD_LOGIC_VECTOR(7 downto 0);
	signal clkDiv_out_wire : STD_LOGIC;
	signal seg7_mux_wire1 : STD_LOGIC_VECTOR(6 downto 0);
	signal seg7_mux_wire2 : STD_LOGIC_VECTOR(6 downto 0);
	signal seg7_mux_wire3 : STD_LOGIC_VECTOR(6 downto 0);
	signal clkDiv100to500_wire : STD_LOGIC;
	signal debounce_clk_in_wire : STD_LOGIC;
	signal debounce_button_out_wire : STD_LOGIC;

	BEGIN
		
		U1: FSM
			port map (A => SW, B => SW, opcode_in => SW(1 downto 0), buttonC => debounce_button_out_wire, clk => CLK100MHZ, operandA => regA_in_wire, operandB => regB_in_wire, operandO => regO_in_wire, display_Mode => fsm_display_mode_out_wire);
        U2: ALU
            port map (opcode_in => regO_out_wire, clk => CLK100MHZ,  A => regA_out_wire, B => regB_out_wire, result => regG_in_wire);
        U3: regA
            port map(D => regA_in_wire, Clk => CLK100MHZ, Q => regA_out_wire);
        U4: regB
            port map(D => regB_in_wire, Clk => CLK100MHZ, Q => regB_out_wire);
        U5: regG
            port map(D => regG_in_wire, Clk => CLK100MHZ, Q => regG_out_wire);
        U6: regO
            port map(D => regO_in_wire, Clk => CLK100MHZ, Q => regO_out_wire);
        U7: BIN2BCD
            port map(BINARY => regG_out_wire, BCD => bin_to_bcd_wire);
        U8: seg7
            port map(bcd => bin_to_bcd_wire(3 downto 0), seg7_out => seg7_mux_wire1);
        U9: seg7
            port map(bcd => bin_to_bcd_wire(7 downto 4), seg7_out => seg7_mux_wire2);
        U10: seg7
            port map(bcd => bin_to_bcd_wire(11 downto 8), seg7_out => seg7_mux_wire3);
        U11: display_Mode_Select_Mux
            port map (regA => regA_out_wire, regB => regB_out_wire, regG => regG_out_wire, regO => regO_out_wire, sel => fsm_display_mode_out_wire, clk => CLK100MHZ, led_out => LED);
        U12: clkDiv100to500
            port map(clk_in => CLK100MHZ, clk_out => debounce_clk_in_wire);
        U13: seg7_mux
            port map (clk => clkDiv100to500_wire, digit1 => seg7_mux_wire1, digit2 => seg7_mux_wire2, digit3 => seg7_mux_wire3, anode => AN, cathode_out(6) => CA, cathode_out(5) => CB, cathode_out(4) => CC, cathode_out(3) => CD, cathode_out(2) => CE, cathode_out(1) => CF, cathode_out(0) => CG);
        U14: clkDiv100to500
            port map (clk_in => CLK100MHZ, clk_out => clkDiv100to500_wire);
        U15: debounce
            port map(button => BTNC, clk => debounce_clk_in_wire, debounce_out => debounce_button_out_wire);
END BEHAVIOUR;