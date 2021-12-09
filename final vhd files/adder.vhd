----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:36:47 12/07/2021 
-- Design Name: 
-- Module Name:    adder - Behavioral 
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

entity adder is
    Port ( X : in  STD_LOGIC_VECTOR (4 downto 1);
           Y : in  STD_LOGIC_VECTOR (4 downto 1);
           C1 : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (4 downto 1);
           C5 : out  STD_LOGIC);
end adder;

architecture Behavioral of adder is
signal internal_S: std_logic_vector(4 downto 0);
begin
		internal_S <= std_logic_vector(('0' & UNSIGNED(X)) + UNSIGNED(Y));
		 
		C5 <= internal_S(4);
		S <= internal_S(3 downto 0);

end Behavioral;