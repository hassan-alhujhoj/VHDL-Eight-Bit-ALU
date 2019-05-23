----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2019 10:14:16
-- Design Name: 
-- Module Name: debounce_tb - Behavioral
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

entity debounce_tb is
--  Port ( );
end debounce_tb;

architecture Behavioral of debounce_tb is

    component debounce 
        Port ( button : in STD_LOGIC;
           clk : in STD_LOGIC;
            debounce_out : out STD_LOGIC);
    end component;

    signal button:STD_LOGIC;
    signal clk: STD_LOGIC;
    signal debounce_out: STD_LOGIC;
    constant T: time := 10ns; --clk period


begin

   UUT: debounce port map ( button => button, clk => clk, debounce_out => debounce_out);
  
   
   
   clk_process: process
     begin
        clk <= '0';
        wait for T/2;
        clk <= '1';
        wait for T/2;
    end process clk_process;
   

   io_process: process
    begin
        --intial input 000
        button <= '0' ;
        wait until falling_edge(clk);
        button <= '0';
        wait until falling_edge(clk);
        button <= '0';
        wait until falling_edge(clk);
        --001
        button <= '0' ;
        wait until falling_edge(clk);
        button <= '0';
        wait until falling_edge(clk);
        button <= '1';
        wait until falling_edge(clk);   
        --010     
        button <= '0' ;
        wait until falling_edge(clk);
        button <= '1';
        wait until falling_edge(clk);
        button <= '0';
        wait until falling_edge(clk);  
        --100         
        button <= '1' ;
        wait until falling_edge(clk);
        button <= '0';
        wait until falling_edge(clk);
        button <= '0';
        wait until falling_edge(clk);                
        --011
        button <= '0' ;
        wait until falling_edge(clk);
        button <= '1';
        wait until falling_edge(clk);
        button <= '1';
        wait until falling_edge(clk);   
        --101           
        button <= '1' ;
        wait until falling_edge(clk);
        button <= '0';
        wait until falling_edge(clk);
        button <= '1';
        wait until falling_edge(clk);
        --110      
        button <= '1' ;
        wait until falling_edge(clk);
        button <= '1';
        wait until falling_edge(clk);
        button <= '0';
        --111
        button <= '1' ;
        wait until falling_edge(clk);
        button <= '1';
        wait until falling_edge(clk);
        button <= '1';  
        
   end process io_process;

end Behavioral;
