library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


<<<<<<< HEAD
-- The reference for the following code can be accessed from this link: https://groups.google.com/forum/#!topic/comp.lang.vhdl/G34FmzBd7v0
=======
-- The reference for the following code can be accessed from this link: https://groups.google.com/d/msg/comp.lang.vhdl/G34FmzBd7v0/qVorUhitSRUJ
>>>>>>> aa15a04b2125ff8008bfe0a483b41b7d59fc7712
entity BIN2BCD is 
  port (BINARY    : in std_logic_vector(7 downto 0);  -- range 0 to 255
		BCD       : out std_logic_vector(11 downto 0));
end BIN2BCD;

architecture COMB of BIN2BCD is

signal BIN2INT      : integer range 0 to 255;
signal HUNDREDS     : integer range 0 to 2;
signal TENS         : integer range 0 to 9;
signal UNIT_S       : integer range 0 to 9;
-- Can't use name UNITS because it's areserved word

begin
-- concurrent assignments
  BIN2INT <= CONV_INTEGER(UNSIGNED(BINARY(7 downto 0))); -- convert to integer
  BCD <= "00" & CONV_STD_LOGIC_VECTOR(HUNDREDS,2) &
CONV_STD_LOGIC_VECTOR(TENS,4)
       & CONV_STD_LOGIC_VECTOR(UNIT_S,4);  -- concatenate the output

-- combinational process using variables
CONVERSION : process (BIN2INT)
  variable REM99_VAR      : integer range 0 to 99; -- remainder after hundreds
  variable HUN_VAR        : integer range 0 to 2;
  variable TEN_VAR        : integer range 0 to 9;
  variable UNIT_VAR       : integer range 0 to 9;

begin

 if BIN2INT > 199 then
   HUN_VAR := 2;
 elsif BIN2INT > 99 then
   HUN_VAR := 1;
 else 
   HUN_VAR := 0;
 end if;

 REM99_VAR := BIN2INT - (HUN_VAR * 100);  

 if REM99_VAR > 89 then
   TEN_VAR := 9;
 elsif REM99_VAR > 79 then
   TEN_VAR := 8;
 elsif REM99_VAR > 69 then
   TEN_VAR := 7;
 elsif REM99_VAR > 59 then
   TEN_VAR := 6;
 elsif REM99_VAR > 49 then
   TEN_VAR := 5;
 elsif REM99_VAR > 39 then
   TEN_VAR := 4;
 elsif REM99_VAR > 29 then
   TEN_VAR := 3;
 elsif REM99_VAR > 19 then
   TEN_VAR := 2;
 elsif REM99_VAR > 9 then
   TEN_VAR := 1;
 else 
   TEN_VAR := 0;
 end if;

 UNIT_VAR := REM99_VAR - (TEN_VAR * 10);

-- assign variables to signals
 HUNDREDS <= HUN_VAR;
 TENS     <= TEN_VAR;
 UNIT_S   <= UNIT_VAR;

end process CONVERSION;
end COMB;