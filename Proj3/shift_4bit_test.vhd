--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:32:07 12/06/2021
-- Design Name:   
-- Module Name:   U:/ECE3561/Proj3/shift_4bit_test.vhd
-- Project Name:  Proj3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_4bit
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
 
ENTITY shift_4bit_test IS
END shift_4bit_test;
 
ARCHITECTURE behavior OF shift_4bit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_4bit
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         SHF_LOAD : IN  std_logic;
         sel : IN  std_logic_vector(1 downto 0);
         d : IN  std_logic_vector(3 downto 0);
         q : INOUT  std_logic_vector(3 downto 0);
         sr_ser : IN  std_logic;
         sl_ser : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal SHF_LOAD : std_logic := '0';
   signal sel : std_logic_vector(1 downto 0) := (others => '0');
   signal d : std_logic_vector(3 downto 0) := (others => '0');
   signal sr_ser : std_logic := '0';
   signal sl_ser : std_logic := '0';

	--BiDirs
   signal q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_4bit PORT MAP (
          clk => clk,
          clr => clr,
          SHF_LOAD => SHF_LOAD,
          sel => sel,
          d => d,
          q => q,
          sr_ser => sr_ser,
          sl_ser => sl_ser
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
		clr<='0';
			wait for 10 ns;
			clr<='1';
			SHF_LOAD<='0';
			d<="1010";
		  -- SR_SERR <= '1';
		  wait for 50 ns;
		  sel<="00";
		  clr<='1';
		  SHF_LOAD<='1';
		  -- d<="1010";
		  SR_SER <='1';
		  wait for 100 ns;
		  sel<="01";
		  clr <= '1';
		  SHF_LOAD<='1';
		  SL_SER <='0';
		  wait for 100 ns;
		  
   end process;

END;
