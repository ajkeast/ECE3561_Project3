---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:10 12/07/2021 
-- Design Name: 
-- Module Name:    shift_9bit - Behavioral 
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

entity shift_9bit is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           d : in  STD_LOGIC_VECTOR (8 downto 0);
           q : inout  STD_LOGIC_VECTOR (8 downto 0);
           sri : in  STD_LOGIC;
           sli : in  STD_LOGIC);
end shift_9bit;

architecture Behavioral of shift_9bit is

begin
process(clk,sri)
	begin
		if (CLR='0')then
			Q <= "000000000";
		elsif clk'event and clk='1' then --Rising edge triggered
		if (SEL="11") then  -- Load data
			Q<=D;
		elsif(SEL="00") then -- Hold data
			Q<=Q;
		elsif(SEL="01")then --Shift Right Operation
			Q(8)<= SRI;
			Q(7)<= Q(8);
			Q(6)<= Q(7);
			Q(5)<= Q(6);
			Q(4)<= Q(5);
			Q(3)<= Q(4);
			Q(2)<= Q(3);
			Q(1)<= Q(2);
			Q(0)<= Q(1);
		elsif(SEL="10")then --Shift Left Operation
			Q(0)<= SLI;
			Q(1)<= Q(0);
			Q(2)<= Q(1);
			Q(3)<= Q(2);
			Q(4)<= Q(3);
			Q(5)<= Q(4);
			Q(6)<= Q(5);
			Q(7)<= Q(6);
			Q(8)<= Q(7);	
			end if;
		end if;
end process;

end Behavioral;