--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:15:24 12/07/2021
-- Design Name:   
-- Module Name:   U:/ECE3561/Proj3/sys_controller_test.vhd
-- Project Name:  Proj3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sys_controller
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
 
ENTITY sys_controller_test IS
END sys_controller_test;
 
ARCHITECTURE behavior OF sys_controller_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sys_controller
    PORT(
         clk : IN  std_logic;
         start : IN  std_logic;
         LSB : IN  std_logic;
         C4 : IN  std_logic;
         S1 : OUT  std_logic_vector(1 downto 0);
         S2 : OUT  std_logic_vector(1 downto 0);
         S3 : OUT  std_logic_vector(1 downto 0);
         clr_res : OUT  std_logic;
         clr_cntr : OUT  std_logic;
         en_cntr : OUT  std_logic;
         DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal LSB : std_logic := '0';
   signal C4 : std_logic := '0';

 	--Outputs
   signal S1 : std_logic_vector(1 downto 0);
   signal S2 : std_logic_vector(1 downto 0);
   signal S3 : std_logic_vector(1 downto 0);
   signal clr_res : std_logic;
   signal clr_cntr : std_logic;
   signal en_cntr : std_logic;
   signal DONE : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sys_controller PORT MAP (
          clk => clk,
          start => start,
          LSB => LSB,
          C4 => C4,
          S1 => S1,
          S2 => S2,
          S3 => S3,
          clr_res => clr_res,
          clr_cntr => clr_cntr,
          en_cntr => en_cntr,
          DONE => DONE
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		start <= '0';
		wait for 50 ns;
		start <='1';
		LSB <= '1';
		C4 <= '0';
		wait for 50 ns;
		C4 <= '1';
		wait for 20 ns;
		wait;
   end process;

END;
