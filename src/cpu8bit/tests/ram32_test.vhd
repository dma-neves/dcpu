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
         En: IN  std_logic;
         adr : IN  std_logic_vector(4 downto 0);
         R : IN  std_logic;
         rw : IN  std_logic;
         DI : IN  std_logic_vector(7 downto 0);
         DO : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal En: std_logic := '0';
   signal adr : std_logic_vector(4 downto 0) := (others => '0');
   signal R : std_logic := '0';
   signal rw : std_logic := '0';
   signal DI : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DO : std_logic_vector(7 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM32 PORT MAP (
          En=> En,
          adr => adr,
          R => R,
          rw => rw,
          DI => DI,
          DO => DO
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		R <= '1';
      wait for 100 ns;	

      -- insert stimulus here 
		
		R <= '0';
		En <= '1';
		wait for 100 ns;
		
		DI <= "01110110";
		adr <= "00100";
		wait for 100 ns;
		
		rw <= '1';
		wait for 100 ns;
		
		DI <= "00000000";
		wait for 100 ns;
		
		rw <= '0';
		wait for 100 ns;
		
		adr <= "00000";
		wait for 100 ns;
		
		adr <= "00100";
		wait for 100 ns;

      wait;
   end process;

END;
