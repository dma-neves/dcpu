LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SevenState_sm_test IS
END SevenState_sm_test;

ARCHITECTURE behavior OF SevenState_sm_test IS

COMPONENT SevenState_sm
PORT(
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    S0 : OUT STD_LOGIC;
    S1 : OUT STD_LOGIC;
    S2 : OUT STD_LOGIC;
    S3 : OUT STD_LOGIC;
    S4 : OUT STD_LOGIC;
    S5 : OUT STD_LOGIC;
    S6 : OUT STD_LOGIC
);
END COMPONENT;

--Inputs
signal clk : STD_LOGIC := '0';
signal reset : STD_LOGIC := '0';

--Outputs
signal S0 : STD_LOGIC;
signal S1 : STD_LOGIC;
signal S2 : STD_LOGIC;
signal S3 : STD_LOGIC;
signal S4 : STD_LOGIC;
signal S5 : STD_LOGIC;
signal S6 : STD_LOGIC;

-- Clock period definitions
constant clk_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: SevenState_sm PORT MAP (
    clk => clk,
    reset => reset,
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
		wait for 400 ns;
		
		wait for 100 ns;
		reset <= '1';
		wait for 50 ns;
      reset <= '0';
end process;
    
END;
