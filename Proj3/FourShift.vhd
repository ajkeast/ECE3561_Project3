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

  main: PROCESS ( D, S, SRI, SLI, CLR, CLK, flw )
  begin
     If ( CLR = '0' ) then --! Asyncronous clear
       flw <= "0000";
     elsif ( K = '0' and K'event ) then --! Syncronous mode
	
       logic_pattern ( SLR, flw(1), flw(0), D(0), S, flw(0) ); 
       logic_pattern ( flw(0), flw(2), flw(1), D(1), S, flw(1) );  
       logic_pattern ( flw(1), flw(3), flw(2), D(2), S, flw(2) );   
       logic_pattern ( flw(2), SLI, flw(3), D(3), S, flw(3) );
    
     end if;
	 

  end process; -- main
  
  Q <= flw;
  
end architecture;
