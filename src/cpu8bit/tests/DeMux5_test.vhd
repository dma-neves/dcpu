
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DeMux5_test IS
END DeMux5_test;
 
ARCHITECTURE behavior OF DeMux5_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DeMux5
    PORT(
         d : IN  std_logic_vector(7 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         I0 : OUT  std_logic_vector(7 downto 0);
         I1 : OUT  std_logic_vector(7 downto 0);
         I2 : OUT  std_logic_vector(7 downto 0);
         I3 : OUT  std_logic_vector(7 downto 0);
         I4 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal I0 : std_logic_vector(7 downto 0);
   signal I1 : std_logic_vector(7 downto 0);
   signal I2 : std_logic_vector(7 downto 0);
   signal I3 : std_logic_vector(7 downto 0);
   signal I4 : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DeMux5 PORT MAP (
          d => d,
          sel => sel,
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4 => I4
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		d <= "10110100";
		sel <= "000";
		wait for 100 ns;
		
		sel <= "001";
		wait for 100 ns;
		
		sel <= "010";
		wait for 100 ns;
		
		sel <= "011";
		wait for 100 ns;
		
		sel <= "100";
		wait for 100 ns;
		
		sel <= "101";
		wait for 100 ns;
		
		sel <= "110";
		wait for 100 ns;
		
		sel <= "111";
		wait for 100 ns;
		
      wait;
   end process;

END;
