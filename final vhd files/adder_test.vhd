--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:15:13 12/07/2021
-- Design Name:   
-- Module Name:   C:/Xilinx/Projects/ECE3561Proj3/adder_test.vhd
-- Project Name:  ECE3561Proj3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY adder_test IS
END adder_test;
 
ARCHITECTURE behavior OF adder_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder
    PORT(
         X : IN  std_logic_vector(4 downto 1);
         Y : IN  std_logic_vector(4 downto 1);
         C1 : IN  std_logic;
         S : OUT  std_logic_vector(4 downto 1);
         C5 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(4 downto 1) := (others => '0');
   signal Y : std_logic_vector(4 downto 1) := (others => '0');
   signal C1 : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(4 downto 1);
   signal C5 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant time_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder PORT MAP (
          X => X,
          Y => Y,
          C1 => C1,
          S => S,
          C5 => C5
        );

   -- Clock process definitions
  -- time_process :process
   --begin
	--	time <= '0';
	--	wait for time_period/2;
	--	time <= '1';
	--	wait for time_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     -- wait for time_period*10;

      -- insert stimulus here 

		X <= "0001";
		Y <= "0001";
		
		wait for 20 ns;
		
		X <= "1111";
		Y <= "0001";
		
		wait for 20 ns;
		
		X <= "0010";
		Y <= "1000";


      wait;
   end process;

END;