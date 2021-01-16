LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY rom_test IS
END rom_test;
 
ARCHITECTURE behavior OF rom_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM32
    PORT(
         adr : IN  std_logic_vector(4 downto 0);
         En : IN  std_logic;
         DO : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal adr : std_logic_vector(4 downto 0) := (others => '0');
   signal En : std_logic := '0';

 	--Outputs
   signal DO : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM32 PORT MAP (
          adr => adr,
          En => En,
          DO => DO
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
		En <= '0';
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here
		En <= '1';
		
		adr <= "00000";
		wait for 100 ns;
		
		adr <= "00001";
		wait for 100 ns;
		
		adr <= "00010";
		wait for 100 ns;
		
		adr <= "00011";
		wait for 100 ns;
		
		adr <= "00100";
		wait for 100 ns;
		
		adr <= "00101";
		wait for 100 ns;
		
		adr <= "00110";
		wait for 100 ns;

      wait;
   end process;

END;
