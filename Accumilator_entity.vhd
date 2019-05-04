library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Accumilator_entity is
	Port ( X 					: in std_logic_vector(3 downto 0);
			result 				: out std_logic_vector(3 downto 0);
			load, reset, clk 	: in std_logic);
end Accumilator_entity;

architecture Accum_Behav of Accumilator_entity is

	signal count : std_logic_vector(1 downto 0);
	signal acc_enable : std_logic;
	signal flag : std_logic;
	signal acc_out : std_logic_vector (3 downto 0);
	signal reg_out : std_logic_vector (3 downto 0);
	
	begin
		clock_proc : process (clk, load) is
			begin
				if (load = '1') then
					count <= "11";
				elsif (clk'event and clk = '1') then
					if flag = '1' then
						count <= count - 1;
					else
						count <= count;
					end if;
				end if;
		end process clock_proc;
		
		reg_process : process (clk, acc_enable, reset) is
			begin
				if (reset = '0') then
					reg_out <= "0000";
				elsif (clk'event and clk = '1') then
					if (acc_enable = '0') then
						reg_out <= reg_out;
					else
						reg_out <= acc_out;
					end if;
				end if;
		end process reg_process;
	
	acc_enable <= '1' when count > "00" else '0';
	flag <= '0' when count = "00" else '1';
	acc_out <= X + reg_out;
	result <= reg_out;
end Accum_Behav;