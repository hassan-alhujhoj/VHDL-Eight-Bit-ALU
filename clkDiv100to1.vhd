LIBRARY ieee;
USE ieee.std_logic_1164.all;


--A clk divider that divides a 100MHz clk to 1 hz and shows that output on LED16_R
ENTITY clkDiv100to1 IS 
	PORT(CLK100MHZ : IN STD_LOGIC;
		 --clk_out   : OUT STD_LOGIC;
		 JA : OUT STD_LOGIC_VECTOR(4 DOWNTO 1) := "0000";
		 LED16_R  : OUT STD_LOGIC);
END clkDiv100to1;

ARCHITECTURE BEHAVIOUR OF clkDiv100to1 IS
	SIGNAL count : INTEGER := 1;
	SIGNAL clock_out : STD_LOGIC := '0';
BEGIN								-- generates a 1Hz clk_out from a 100MHz clk_in.
	PROCESS(CLK100MHZ)
		BEGIN
			if(CLK100MHZ'EVENT AND CLK100MHZ = '1') then
				count <= count + 1;
				if(count = 50000000) then           -- if counter == 50,000,000
					clock_out <= not clock_out;     --  toggle clock
				count <= 1;                         --  reset counter
				end if;
			end if;
	END PROCESS;
	--clk_out <= clock_out;
	JA(1) <= clock_out;       --JA(1) <= CLK100MHZ;  -- This is to test out the clk_out PWM signal form pin JA(1) PORT JA
	LED16_R <= clock_out;
END BEHAVIOUR;