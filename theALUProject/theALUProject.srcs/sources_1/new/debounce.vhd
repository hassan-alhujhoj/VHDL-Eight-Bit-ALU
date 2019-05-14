----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2019 16:18:56
-- Design Name: 
-- Module Name: debounce - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
