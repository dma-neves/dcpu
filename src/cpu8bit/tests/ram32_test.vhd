--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:46:03 12/07/2020
-- Design Name:   
-- Module Name:   /home/david/Desktop/David/Programming/HDL/projects/8bitCPU/src/cpu8bit/Memory/ram32_test.vhd
-- Project Name:  cpu8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM32
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
 
ENTITY ram32_test IS
END ram32_test;
 
ARCHITECTURE behavior OF ram32_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM32
    PORT(
         clk : IN  std_logic;
         adr : IN  std_logic_vector(4 downto 0);
         R : IN  std_logic;
         rw : IN  std_logic;
         DI : IN  std_logic_vector(7 downto 0);
         DO : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal adr : std_logic_vector(4 downto 0) := (others => '0');
   signal R : std_logic := '0';
   signal rw : std_logic := '0';
   signal DI : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DO : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM32 PORT MAP (
          clk => clk,
          adr => adr,
          R => R,
          rw => rw,
          DI => DI,
          DO => DO
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		wait for clk_period*0.5;
		
		R <= '1';
		wait for clk_period*3;
		
		R <= '0';
		wait for clk_period*3;
		
		DI <= "01110110";
		adr <= "00100";
		rw <= '1';
		wait for clk_period;
		
		rw <= '0';
		wait for clk_period;
		
		adr <= "00000";
		wait for clk_period;
		
		adr <= "00001";
		wait for clk_period;

      wait;
   end process;

END;
