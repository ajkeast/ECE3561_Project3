--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:19:44 12/09/2021
-- Design Name:   
-- Module Name:   U:/ECE3561/final_project/top_test.vhd
-- Project Name:  final_project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY top_test IS
END top_test;
 
ARCHITECTURE behavior OF top_test IS
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         Multiplier : IN  std_logic_vector(3 downto 0);
         Multiplicand : IN  std_logic_vector(3 downto 0);
         START : IN  std_logic;
         CLK : IN  std_logic;
         Product : OUT  std_logic_vector(7 downto 0);
         DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Multiplier : std_logic_vector(3 downto 0) := (others => '0');
   signal Multiplicand : std_logic_vector(3 downto 0) := (others => '0');
   signal START : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Product : std_logic_vector(7 downto 0);
   signal DONE : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          Multiplier => Multiplier,
          Multiplicand => Multiplicand,
          START => START,
          CLK => CLK,
          Product => Product,
          DONE => DONE
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      wait for CLK_period*10;
		
		start <='0';
		multiplier <= "0100";
		multiplicand  <= "0010";
		wait for 50 ns;
		
		start <='1';
		wait for CLK_period*10;
		
		start <='0';
      multiplier <= "0011";
		multiplicand  <= "0101";
		wait for 50ns;
		
		start <='1';
		wait for CLK_period*10;
		wait;
   end process;

END;
