--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:33:07 12/24/2020
-- Design Name:   
-- Module Name:   /home/david/Desktop/David/Programming/HDL/projects/8bitCPU/src/cpu8bit/Memory/reg_test.vhd
-- Project Name:  cpu8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_8bit
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
 
ENTITY reg_test IS
END reg_test;
 
ARCHITECTURE behavior OF reg_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_8bit
    PORT(
         En : IN  std_logic;
         R : IN  std_logic;
         DIn : IN  std_logic_vector(7 downto 0);
         DOut : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal En : std_logic := '0';
   signal R : std_logic := '0';
   signal DIn : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DOut : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_8bit PORT MAP (
          En => En,
          R => R,
          DIn => DIn,
          DOut => DOut
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		
		DIn <= "11110011";
		R <= '0';
		En <= '0';
		wait for 100 ns;
		
		En <= '1';
		wait for 100 ns;
		
		En <= '0';
		wait for 100 ns;
		
		DIn <= "00000000";
		wait for 100 ns;
		
		DIn <= "00111111";
		wait for 100 ns;
		
		R <= '1';
		wait for 100 ns;
		
		R <= '0';
		wait for 100 ns;
		
		En <= '1';
		wait for 100 ns;
		
		En <= '0';
		wait for 100 ns;
		
		DIn <= "00000000";
		wait for 100 ns;

      wait;
   end process;

END;
