----------------------------------------------------------------------------------
-- Academic Institution: University of Canterbury. 
-- Engineer: Hassan Alhujhoj (haa61), Jin Su Kim (jsk71), Abdullah Naeem (ana104)
-- 
-- Create Date: 24.05.2019 15:15:15
-- Design Name: VHDL programming
-- Module Name: debounce_tb - behavioural
-- Project Name: ALU + FSM + REG Project
-- Target Devices: Nexys 4 DDR Artix-7 FPGA
-- Tool Versions: VHDL Vivado
-- Description: This module is testbench file. It test the debounce.vhd file by siluating it and obtaining the result with out using the FPGA board.
-- 
-- Revision: Code has been revised by all three designers, Hassan A, Jin K, and Abdullah N (24/05/2019).

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounce_tb is
--  Port ( );
end debounce_tb;

architecture behavioural of debounce_tb is

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

end behavioural;
