LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux5_test IS
END mux5_test;
 
ARCHITECTURE behavior OF mux5_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux5
    PORT(
         I0 : IN  std_logic_vector(7 downto 0);
         I1 : IN  std_logic_vector(7 downto 0);
         I2 : IN  std_logic_vector(7 downto 0);
         I3 : IN  std_logic_vector(7 downto 0);
         I4_7 : IN  std_logic_vector(7 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I0 : std_logic_vector(7 downto 0) := (others => '0');
   signal I1 : std_logic_vector(7 downto 0) := (others => '0');
   signal I2 : std_logic_vector(7 downto 0) := (others => '0');
   signal I3 : std_logic_vector(7 downto 0) := (others => '0');
   signal I4_7 : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux5 PORT MAP (
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4_7 => I4_7,
          sel => sel,
          o => o
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
		
		I0 <= "11011010";
		I1 <= "00101101";
		I2 <= "11111000";
		I3 <= "10101000";
		I4_7 <= "00001010";
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
