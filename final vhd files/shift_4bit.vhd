----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:18:24 12/06/2021 
-- Design Name: 
-- Module Name:    shift_4bit - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_4bit is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : inout  STD_LOGIC_VECTOR (3 downto 0);
           sri : in  STD_LOGIC;
           sli : in  STD_LOGIC);
end shift_4bit;

architecture Behavioral of shift_4bit is

begin
process(clk,sri)
	begin
		if (CLR='0')then
			Q <= "0000";
		elsif clk'event and clk='1' then
		if (SEL="11") then  -- Load data
			Q<=D;
		elsif(SEL="00") then -- Hold data
			Q<=Q;
		elsif(SEL="01")then -- Shift Right Operation
			Q(3)<= SRI;
			Q(2)<= Q(3);
			Q(1)<= Q(2);
			Q(0)<= Q(1);
		elsif(SEL="10")then -- Shift Left Operation
			Q(0)<= SLI;
			Q(1)<= Q(0);
			Q(2)<= Q(1);
			Q(3)<= Q(2);
			end if;
		end if;
end process;

end Behavioral;