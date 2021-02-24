
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY demux32_1b_test IS
END demux32_1b_test;
 
ARCHITECTURE behavior OF demux32_1b_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DeMux32_1b
    PORT(
         d : IN  std_logic;
         sel : IN  std_logic_vector(4 downto 0);
         o : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic := '0';
   signal sel : std_logic_vector(4 downto 0) := (others => '0');
   signal o : std_logic_vector(31 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DeMux32_1b PORT MAP (
          d => d,
          sel => sel,
          o => o
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		d <= '1';

		sel <= "00000";
		wait for 100 ns;
		sel <= "00001";
		wait for 100 ns;
		sel <= "00010";
		wait for 100 ns;
		sel <= "00011";
		wait for 100 ns;
		sel <= "00100";
		wait for 100 ns;
		sel <= "00101";
		wait for 100 ns;
		sel <= "00110";
		wait for 100 ns;
		sel <= "00111";
		wait for 100 ns;
		sel <= "01000";
		wait for 100 ns;
		sel <= "01001";
		wait for 100 ns;
		sel <= "01010";
		wait for 100 ns;
		sel <= "01011";
		wait for 100 ns;
		sel <= "01100";
		wait for 100 ns;
		sel <= "01101";
		wait for 100 ns;
		sel <= "01110";
		wait for 100 ns;
		sel <= "01111";
		wait for 100 ns;
		sel <= "10000";
		wait for 100 ns;
		sel <= "10001";
		wait for 100 ns;
		sel <= "10010";
		wait for 100 ns;
		sel <= "10011";
		wait for 100 ns;
		sel <= "10100";
		wait for 100 ns;
		sel <= "10101";
		wait for 100 ns;
		sel <= "10110";
		wait for 100 ns;
		sel <= "10111";
		wait for 100 ns;
		sel <= "11000";
		wait for 100 ns;
		sel <= "11001";
		wait for 100 ns;
		sel <= "11010";
		wait for 100 ns;
		sel <= "11011";
		wait for 100 ns;
		sel <= "11100";
		wait for 100 ns;
		sel <= "11101";
		wait for 100 ns;
		sel <= "11110";
		wait for 100 ns;
		sel <= "11111";
		wait for 100 ns;

      wait;
   end process;

END;
