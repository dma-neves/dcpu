--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:55:32 12/06/2020
-- Design Name:   
-- Module Name:   /home/david/Desktop/David/Programming/HDL/projects/8bitCPU/src/cpu8bit/Mux/demux_test.vhd
-- Project Name:  cpu8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DeMux4
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
 
ENTITY demux_test IS
END demux_test;
 
ARCHITECTURE behavior OF demux_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DeMux4
    PORT(
         d : IN  std_logic_vector(7 downto 0);
         sel : IN  std_logic_vector(1 downto 0);
         I0 : OUT  std_logic_vector(7 downto 0);
         I1 : OUT  std_logic_vector(7 downto 0);
         I2 : OUT  std_logic_vector(7 downto 0);
         I3 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal I0 : std_logic_vector(7 downto 0);
   signal I1 : std_logic_vector(7 downto 0);
   signal I2 : std_logic_vector(7 downto 0);
   signal I3 : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DeMux4 PORT MAP (
          d => d,
          sel => sel,
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3
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
		
		D <= "01101110";
		sel <= "00";
		wait for 100 ns;
		
		sel <= "01";
		wait for 100 ns;
		
		sel <= "10";
		wait for 100 ns;
		
		sel <= "11";
		wait for 100 ns;

      wait;
   end process;

END;
