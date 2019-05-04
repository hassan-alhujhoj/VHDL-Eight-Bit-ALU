LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Full_Adder_4_bit is
	port ( Cin 				: in std_logic;
			a3, a2, a1, a0 	: in std_logic;
			b3, b2, b1, b0 	: in std_logic;
			s3, s2, s1, s0 	: out std_logic;
			Cout 			: out std_logic);
end Full_Adder_4_bit;

architecture struct of Full_Adder_4_bit is
	
	signal c1, c2, c3 : std_logic;
	
	component full_adder
		port (Cin, a, b : in std_logic;
				Sum, Cout : out std_logic);
	end component;
	
	begin
		stage0 : full_adder
			port map(Cin, a0, b0, s0, c1);
		stage1 : full_adder
			port map(c1, a1, b1, s1, c2);
		stage2 : full_adder
			port map(c2, a2, b2, s2, c3);
		stage3: full_adder
			port map(Cin => c3, a => a3, b => b3, Sum => s3, Cout => Cout);
end struct;