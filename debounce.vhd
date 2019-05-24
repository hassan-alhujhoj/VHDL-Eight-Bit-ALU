----------------------------------------------------------------------------------
-- Academic Institution: University of Canterbury. 
-- Engineer: Hassan Alhujhoj (haa61), Jin Su Kim (jsk71), Abdullah Naeem (ana104)
-- 
-- Create Date: 22.05.2019 10:49:33
-- Design Name: VHDL programming
-- Module Name: debounce - behavioural
-- Project Name: ALU + FSM + REG Project
-- Target Devices: Nexys 4 DDR Artix-7 FPGA
-- Tool Versions: VHDL Vivado
-- Description: This code implements a debouncer module that reduces the effects of button debounging.
-- 
-- Revision: Code has been revised by all three designers, Hassan A, Jin K, and Abdullah N (24/05/2019).

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounce is
    Port ( button : in STD_LOGIC;
           clk : in STD_LOGIC;
           debounce_out : out STD_LOGIC);
end debounce;

architecture Behavioral of debounce is

signal Q1, Q2, Q3 : std_logic;

begin
process(clk)
begin
   if (clk'event and clk = '1') then

         Q1 <= button;
         Q2 <= Q1;
         Q3 <= Q2;
   end if;
end process;

debounce_out <= Q1 and Q2 and (not Q3);


end Behavioral;
