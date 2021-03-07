
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY rom256_test IS
END rom256_test;
 
ARCHITECTURE behavior OF rom256_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM256
    PORT(
         adr : IN  std_logic_vector(7 downto 0);
         En : IN  std_logic;
         DO : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal adr : std_logic_vector(7 downto 0) := (others => '0');
   signal En : std_logic := '0';

 	--Outputs
   signal DO : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM256 PORT MAP (
          adr => adr,
          En => En,
          DO => DO
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		
		En <= '1';
		adr <= "00000000";
		wait for 100 ns;
		
		adr <= "00000001";
		wait for 100 ns;
		
		adr <= "00000010";
		wait for 100 ns;
		
		adr <= "00000011";
		wait for 100 ns;
		
		adr <= "00000100";
		wait for 100 ns;
		
		adr <= "00000101";
		wait for 100 ns;

      wait;
   end process;

END;
