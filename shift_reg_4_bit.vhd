LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity shift_reg_4_bit is
	port( CLK, RESET, SI 	: in std_logic;
			Q 				: out std_logic_vector(3 downto 0);
			SO 				: out std_logic);
end shift_reg_4_bit;

architecture SR4_Arch of shift_reg_4_bit is
	
	signal shifty : std_logic_vector(3 downto 0);
	
	begin
		process (RESET, CLK) is
			begin
				if RESET = '1' then -- asynch reset, active hi
					shifty <= "0000";
				elsif (CLK'event and CLK = '1') then
					shifty <= shifty(2 downto 0) & SI; -- shift left
				end if;
		end process;
	Q <= shifty;
	SO <= shifty(3);
end SR4_Arch;