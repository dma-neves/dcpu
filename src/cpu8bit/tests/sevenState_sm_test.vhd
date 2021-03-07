
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY sevenState_sm_test IS
END sevenState_sm_test;
 
ARCHITECTURE behavior OF sevenState_sm_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SevenState_sm
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         S0 : OUT  std_logic;
         S1 : OUT  std_logic;
         S2 : OUT  std_logic;
			S3 : OUT  std_logic;
         S4 : OUT  std_logic;
         S5 : OUT  std_logic;
			S6 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';

 	--Outputs
   signal S0 : std_logic;
   signal S1 : std_logic;
   signal S2 : std_logic;
	signal S3 : std_logic;
   signal S4 : std_logic;
   signal S5 : std_logic;
	signal S6 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SevenState_sm PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          S0 => S0,
          S1 => S1,
          S2 => S2,
			 S3 => S3,
          S4 => S4,
          S5 => S5,
			 S6 => S6
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
		reset <= '1';
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		reset <= '0';
		wait for 100 ns;
		
		start <= '1';
		wait for 100 ns;
		
		start <= '0';
		wait for 100 ns;
		
		wait for 100 ns;
		reset <= '1';
		wait for 100 ns;
	
      wait;
   end process;

END;
