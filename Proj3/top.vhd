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
    Port ( M : in STD_LOGIC_VECTOR (4 downto 1);
           N : in  STD_LOGIC_VECTOR (4 downto 1);
           START : in  STD_LOGIC;
			  CLK : in STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (8 downto 1);
           DONE : out  STD_LOGIC);
end top;

architecture Behavioral of top is
signal QM: STD_LOGIC_VECTOR (3 downto 0);
signal QN: STD_LOGIC; 
signal Aout: STD_LOGIC_VECTOR (3 downto 0);
signal Cout: STD_LOGIC_VECTOR (3 downto 0);



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



begin

C: sys_controller	
					port map(CLK => clk, START => start, QN => LSB, C4 => C4, S1 => S1, S2 => S2, S3 => S3, clr_res => clr_res, clr_cntr => clr_cntr, en_cntr => en_cntr, DONE => DONE)  

T: counter
					port map(Clk => CLK, en_cntr => ENT, clr_cntr => CLR, C4 => Q(2))
					
A: adder
				   port map(QM => X, R(7 downto 4) => Y, Aout => S, '0' => C1)

M: shift_4bit
					port map(CLK => clk, S1 => sel, M => d, QM => q, '1' => clr, '0' => sri, '0' => sli)

N: shift_4bit
					port map(CLK => clk, S2 => sel, N => d, QN => q(0), '1' => clr, '0' => sri, '0' => sli)

Reg: shift_9bit 
					port map(CLK => clk, clr_res => clr, S3 => sel, Aout => d(7 downto 4), R(9 downto 1) => q(7 downto 0), C5 => d(8), '0' => sri, '0' = sli)
					
--Product <= QS(7 downto 0);

end Behavioral;
