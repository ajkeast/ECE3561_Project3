----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:59 11/29/2021 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( CLR : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  ENT : in	STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is
		signal count : STD_LOGIC_VECTOR (3 downto 0);
BEGIN
	process(ENT, CLR, CLK)
	begin
		if (ENT = '1') then
				if (CLR = '1') then 
						count <= "0000";
				elsif (CLK'event and CLK = '1') then
						 count <= count +  1;
				end if;
		end if; 
	end process;
	
	Q <= count;

END;
