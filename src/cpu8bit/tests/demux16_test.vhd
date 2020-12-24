--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:13:01 12/07/2020
-- Design Name:   
-- Module Name:   /home/david/Desktop/David/Programming/HDL/projects/8bitCPU/src/cpu8bit/Mux/demux16_test.vhd
-- Project Name:  cpu8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DeMux16_1b
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
 
ENTITY demux16_test IS
END demux16_test;
 
ARCHITECTURE behavior OF demux16_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DeMux16_1b
    PORT(
         d : IN  std_logic;
         sel : IN  std_logic_vector(3 downto 0);
         I0 : OUT  std_logic;
         I1 : OUT  std_logic;
         I2 : OUT  std_logic;
         I3 : OUT  std_logic;
         I4 : OUT  std_logic;
         I5 : OUT  std_logic;
         I6 : OUT  std_logic;
         I7 : OUT  std_logic;
         I8 : OUT  std_logic;
         I9 : OUT  std_logic;
         I10 : OUT  std_logic;
         I11 : OUT  std_logic;
         I12 : OUT  std_logic;
         I13 : OUT  std_logic;
         I14 : OUT  std_logic;
         I15 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic := '0';
   signal sel : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal I0 : std_logic;
   signal I1 : std_logic;
   signal I2 : std_logic;
   signal I3 : std_logic;
   signal I4 : std_logic;
   signal I5 : std_logic;
   signal I6 : std_logic;
   signal I7 : std_logic;
   signal I8 : std_logic;
   signal I9 : std_logic;
   signal I10 : std_logic;
   signal I11 : std_logic;
   signal I12 : std_logic;
   signal I13 : std_logic;
   signal I14 : std_logic;
   signal I15 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DeMux16_1b PORT MAP (
          d => d,
          sel => sel,
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4 => I4,
          I5 => I5,
          I6 => I6,
          I7 => I7,
          I8 => I8,
          I9 => I9,
          I10 => I10,
          I11 => I11,
          I12 => I12,
          I13 => I13,
          I14 => I14,
          I15 => I15
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
		
		d <= '1';
		
		sel <= "0000";
		wait for 100 ns;
		
		sel <= "0001";
		wait for 100 ns;
		
		sel <= "0010";
		wait for 100 ns;
		
		sel <= "0011";
		wait for 100 ns;
		
		sel <= "0100";
		wait for 100 ns;
		
		sel <= "0101";
		wait for 100 ns;
		
		sel <= "0110";
		wait for 100 ns;
		
		sel <= "0111";
		wait for 100 ns;
		
		sel <= "1000";
		wait for 100 ns;
		
		sel <= "1001";
		wait for 100 ns;
		
		sel <= "1010";
		wait for 100 ns;
		
		sel <= "1011";
		wait for 100 ns;
		
		sel <= "1100";
		wait for 100 ns;
		
		sel <= "1101";
		wait for 100 ns;
		
		sel <= "1110";
		wait for 100 ns;
		
		sel <= "1111";
		wait for 100 ns;
		
		wait for 100 ns;
		
		d <= '0';
		
		sel <= "0000";
		wait for 100 ns;
		
		sel <= "0001";
		wait for 100 ns;
		
		sel <= "0010";
		wait for 100 ns;
		
		sel <= "0011";
		wait for 100 ns;
		
		sel <= "0100";
		wait for 100 ns;
		
		sel <= "0101";
		wait for 100 ns;
		
		sel <= "0110";
		wait for 100 ns;
		
		sel <= "0111";
		wait for 100 ns;
		
		sel <= "1000";
		wait for 100 ns;
		
		sel <= "1001";
		wait for 100 ns;
		
		sel <= "1010";
		wait for 100 ns;
		
		sel <= "1011";
		wait for 100 ns;
		
		sel <= "1100";
		wait for 100 ns;
		
		sel <= "1101";
		wait for 100 ns;
		
		sel <= "1110";
		wait for 100 ns;
		
		sel <= "1111";
		wait for 100 ns;

      wait;
   end process;

END;
