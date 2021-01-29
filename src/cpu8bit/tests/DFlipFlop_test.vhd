
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DFlipFlop_test IS
END DFlipFlop_test;
 
ARCHITECTURE behavior OF DFlipFlop_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DFlipFlop
    PORT(
         D : IN  std_logic;
         En : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal En : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DFlipFlop PORT MAP (
          D => D,
          En => En,
          R => R,
          Q => Q
        );



   -- Stimulus process
   stim_proc: process
   begin		
		
		R <= '1';
		En <= '0';
		wait for 100 ns;
		
		R <= '0';
		D <= '1';
		wait for 100 ns;
		
		En <= '1';
		wait for 100 ns;
		
		D <= '0';
		wait for 100 ns;
		
		En <= '0';
		wait for 100 ns;

      wait;
   end process;

END;
