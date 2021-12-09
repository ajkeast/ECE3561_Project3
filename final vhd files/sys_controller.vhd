----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:46:53 12/07/2021 
-- Design Name: 
-- Module Name:    sys_controller - Behavioral 
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

entity sys_controller is
    Port ( clk : in  STD_LOGIC;
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
end sys_controller;

architecture Behavioral of sys_controller is

type State_type is (HaltS,Init,Load,Add,Shift);
Signal State:State_type;

begin

	-- More model lines between states
process(clk,start)
begin
	if(start = '0') then
		S1 		<= "00";
		S2 		<= "00";
		S3 		<= "00";
		en_cntr 	<= '0';
		clr_cntr <= '1';
		clr_res	<= '1';
		done		<= '1';
		state 	<= Init;
	elsif clk'event and clk='1' then
		case state is 		
			when Init =>             -- State is Init
				S1 		<= "00";
				S2 		<= "00";
				S3 		<= "00";
				en_cntr 	<= '0';
				clr_cntr <= '1';
				clr_res	<= '1';
				done		<= '1';
				state 	<= Init;
				if start = '1' then
					state <= Load;
				elsif start = '0' then
					state <= Init;
				end if;
			when Load =>             -- State is Load
				S1 		<= "11";
				S2 		<= "11";
				S3 		<= "00";
				en_cntr 	<= '1';
				clr_cntr <= '0';
				clr_res	<= '0';
				done		<= '0';
				if LSB = '1' then
					state <= Add;
				elsif LSB = '0' then
					state <= Shift;
				end if;
			when Add =>              -- State is Add (always proceeds to shift)
				S1 		<= "00";
				S2 		<= "00";
				S3 		<= "11";
				en_cntr 	<= '0';
				clr_cntr <= '0';
				clr_res	<= '0';
				done		<= '0';
				state		<= Shift;
			when Shift =>            -- State is Shift
				S1 		<= "00";
				S2 		<= "01";
				S3 		<= "01";
				en_cntr 	<= '1';
				clr_cntr <= '0';
				clr_res	<= '0';
				done		<= '0';
				if C4 = '0' and LSB = '1' then
					state <= Add;
				elsif C4 = '0' and LSB = '0' then
					state <= Shift;
				elsif C4 = '1' then
					state <= HaltS;	 
				end if;
			when HaltS =>             -- State is HaltS(done)
				S1 		<= "00";
				S2 		<= "00";
				S3 		<= "00";
				en_cntr 	<= '0';
				clr_cntr <= '0';
				clr_res	<= '0';
				done		<= '1';
				if start = '1' then 
					state <= HaltS;
				elsif start ='0' then
					state <= Init;
				end if;
		end case;
	end if;
end process;

	-- Moore model outputs to control the datapath
--	done <= '1' when state = Init else '0';
--	done <= '1' when state = HaltS;
--	done <= '0' when state = Load;
--	done <= '0' when state = Add;
--	done <= '0' when state = Shift;
--	
--	S1 <= "11" when state = Load else "00";
--	
--	S2 <= "11" when state = Load;
--	S2 <= "01" when state = Shift;
--	S2 <= "00" when state = Add;
--	S2 <= "00" when state = HaltS;
--	S2 <= "00" when state = Init;
--	
--	S3 <= "11" when state = Add;
--	S3 <= "01" when state = Shift;
--	S3 <= "00" when state = Init;
--	S3 <= "00" when state = Load;
--	S3 <= "00" when state = HaltS;
--	
--	en_cntr <= '1' when state = Shift else '0';
--	clr_cntr <= '1' when state = Init else '0';
--	clr_res <= '1' when state = Init else '0';
	
end Behavioral;