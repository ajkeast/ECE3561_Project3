----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:12 11/11/2021 
-- Design Name: 
-- Module Name:    FourShift - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FourShift is
    Port ( CLK :	in	STD_LOGIC;
			  D	:	in	STD_LOGIC_VECTOR (3 DOWNTO 0);
			  S	:	in	STD_LOGIC_VECTOR (1 DOWNTO 0);
			  SLI	:	in	STD_LOGIC;
			  SRI	:	in STD_LOGIC;
			  CLR	:	in STD_LOGIC;
			  
			  Q	:	out	STD_LOGIC_VECTOR (3 DOWNTO 0);
end FourShift;

architecture Behavioral of FourShift is

  procedure logic_pattern (
	signal ff0: in std_Logic; --! First Function-feed Input
	signal ff1: in std_Logic; --! Second Function-feed Input
	signal ff2: in std_Logic; --! Third Function-feed Input
	signal b: in std_Logic; --! Input Bit
	signal s: in std_Logic_Vector ( 1 DOWNTO 0 ); --! Mode Control
	signal o: out std_Logic --! Logic Output
        ) is
  begin
	o <= (
		( b and (not s(0)) and (not s(1)) ) OR
		( ff0 and (not s(0)) and s(1) ) OR
		( ff1 and s(0) and (not s(1)) ) OR
		( ff2 and s(0) and s(1) )
	);

  end procedure;

begin




end Behavioral;

