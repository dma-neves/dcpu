LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY memrow_test IS
END memrow_test;
 
ARCHITECTURE behavior OF memrow_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemRow16b
    PORT(
         adr : IN  std_logic_vector(3 downto 0);
         R : IN  std_logic;
         rw : IN  std_logic;
         DI : IN  std_logic;
         DO : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal adr : std_logic_vector(3 downto 0) := (others => '0');
   signal R : std_logic := '0';
   signal rw : std_logic := '0';
   signal DI : std_logic := '0';

 	--Outputs
   signal DO : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemRow16b PORT MAP (
          adr => adr,
          R => R,
          rw => rw,
          DI => DI,
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
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here
		
		R <= '1';
		wait for 100 ns;
		
		R <= '0';
		wait for 100 ns;
		
		DI <= '1';
		adr <= "0100";
		rw <= '1';
		wait for 100 ns;
		
		rw <= '0';		
		adr <= "0000";
		wait for 100 ns;
		
		DI <= '1';
		adr <= "0011";
		rw <= '1';
		wait for 100 ns;
		
		rw <= '0';
		adr <= "0000";
		wait for 100 ns;
		
		adr <= "0100";
		wait for 100 ns;
		
		adr <= "0011";
		wait for 100 ns;

      wait;
   end process;

END;
