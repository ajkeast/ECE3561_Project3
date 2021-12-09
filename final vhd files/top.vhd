----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:26 11/11/2021 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
    Port ( Multiplier : in STD_LOGIC_VECTOR (3 downto 0);
           Multiplicand : in  STD_LOGIC_VECTOR (3 downto 0);
           START : in  STD_LOGIC;
			  CLK : in STD_LOGIC;
           Product : out  STD_LOGIC_VECTOR (7 downto 0);
           DONE : out  STD_LOGIC);
end top;

architecture Behavioral of top is

component shift_4bit			--Multiplicand (M)
   Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : inout  STD_LOGIC_VECTOR (3 downto 0);
           sri : in  STD_LOGIC;
           sli : in  STD_LOGIC);
	end component;
		
		
component shift_9bit				-- 9 bit shift register
	Port (  clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           d : in  STD_LOGIC_VECTOR (8 downto 0);
           q : inout  STD_LOGIC_VECTOR (8 downto 0);
           sri : in  STD_LOGIC;
           sli : in  STD_LOGIC);
	end component;
		
		
component adder					-- Adder
	Port (   X : in  STD_LOGIC_VECTOR (4 downto 1);
				Y : in  STD_LOGIC_VECTOR (4 downto 1);
				C1 : in  STD_LOGIC;
				S : out  STD_LOGIC_VECTOR (4 downto 1);
				C5 : out  STD_LOGIC);
		end component;

component counter 				-- Counter
	Port (  CLR : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  ENT : in	STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
			 
component sys_controller		-- System Controller
	Port (  clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           LSB : in  STD_LOGIC;
           C4 : in  STD_LOGIC;
           S1 : out  STD_LOGIC_VECTOR (1 downto 0);
           S2 : out  STD_LOGIC_VECTOR (1 downto 0);
           S3 : out  STD_LOGIC_VECTOR (1 downto 0);
           clr_res : out  STD_LOGIC;
           clr_cntr : out  STD_LOGIC;
           en_cntr : out  STD_LOGIC;
           DONE : out  STD_LOGIC);
	end component;

-- Internal Signals
signal shift_9bit_in:	STD_LOGIC_VECTOR (8 downto 0);
signal shift_9bit_out:	STD_LOGIC_VECTOR (8 downto 0);

signal counter_out:		STD_LOGIC_VECTOR (3 downto 0);
signal multiplier_out:	STD_LOGIC_VECTOR (3 downto 0);
signal multiplicand_out:STD_LOGIC_VECTOR (3 downto 0);
signal adder_out:			STD_LOGIC_VECTOR (3 downto 0);


signal set1_out:			STD_LOGIC_VECTOR (1 downto 0);	
signal set2_out:			STD_LOGIC_VECTOR (1 downto 0);	
signal set3_out:			STD_LOGIC_VECTOR (1 downto 0);	

signal CLR_RES_OUT:		STD_LOGIC;
signal CLR_CNTR_OUT:		STD_LOGIC;
signal EN_CNTR_OUT:		STD_LOGIC;
signal DONE_OUT:			STD_LOGIC;
signal C5_out:				STD_LOGIC;

begin

C: sys_controller	
					port map(clk,start,multiplicand_out(0),counter_out(2),set1_out,set2_out,set3_out,CLR_RES_OUT,CLR_CNTR_OUT,EN_CNTR_OUT,DONE_OUT);  

T: counter
					port map(CLR_CNTR_OUT,clk,EN_CNTR_OUT,counter_out);
					
A: adder
				   port map(multiplier_out,shift_9bit_out(7 downto 4),'0',adder_out,C5_out);

M: shift_4bit --Multiplier
					port map(clk,'1',set1_out,Multiplier,multiplier_out,'0','0');

N: shift_4bit --Multiplicand
					port map(clk,'1',set2_out,Multiplicand,multiplicand_out,'0','0');

shift_9bit_in <= c5_out & adder_out & shift_9bit_out(3 downto 0);

Reg: shift_9bit 
					port map(clk,CLR_RES_OUT,set3_out,shift_9bit_in,shift_9bit_out,'0','0') ;
					
Product <= shift_9bit_out(7 downto 0);

end Behavioral;