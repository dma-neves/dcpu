
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux8_test IS
END mux8_test;
 
ARCHITECTURE behavior OF mux8_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux8
    PORT(
         I0 : IN  std_logic_vector(7 downto 0);
         I1 : IN  std_logic_vector(7 downto 0);
         I2 : IN  std_logic_vector(7 downto 0);
         I3 : IN  std_logic_vector(7 downto 0);
         I4 : IN  std_logic_vector(7 downto 0);
         I5 : IN  std_logic_vector(7 downto 0);
         I6 : IN  std_logic_vector(7 downto 0);
         I7 : IN  std_logic_vector(7 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I0 : std_logic_vector(7 downto 0) := (others => '0');
   signal I1 : std_logic_vector(7 downto 0) := (others => '0');
   signal I2 : std_logic_vector(7 downto 0) := (others => '0');
   signal I3 : std_logic_vector(7 downto 0) := (others => '0');
   signal I4 : std_logic_vector(7 downto 0) := (others => '0');
   signal I5 : std_logic_vector(7 downto 0) := (others => '0');
   signal I6 : std_logic_vector(7 downto 0) := (others => '0');
   signal I7 : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux8 PORT MAP (
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4 => I4,
          I5 => I5,
          I6 => I6,
          I7 => I7,
          sel => sel,
          o => o
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
	
		I0 <= "00000000";
		I1 <= "00000001";
		I2 <= "00000010";
		I3 <= "00000011";
		I4 <= "00000100";
		I5 <= "00000101";
		I6 <= "00000110";
		I7 <= "00000111";
	
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

   end process;

END;
