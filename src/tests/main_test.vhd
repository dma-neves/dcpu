LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Main_test IS
END Main_test;

ARCHITECTURE behavior OF Main_test IS

COMPONENT Main
PORT(
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    run : IN STD_LOGIC;
    step : IN STD_LOGIC;
    regSel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    GPR : OUT STD_LOGIC_VECTOR(15 downto 0);
    regIC : OUT STD_LOGIC_VECTOR(15 downto 0);
    regIR : OUT STD_LOGIC_VECTOR(15 downto 0);
    regIDR : OUT STD_LOGIC_VECTOR(15 downto 0);
    regIACR : OUT STD_LOGIC_VECTOR(15 downto 0);
    regPACR : OUT STD_LOGIC_VECTOR(15 downto 0);
    regADR : OUT STD_LOGIC_VECTOR(15 downto 0);
    state_0 : OUT STD_LOGIC;
    state_1 : OUT STD_LOGIC;
    state_2 : OUT STD_LOGIC;
    state_3 : OUT STD_LOGIC;
    state_4 : OUT STD_LOGIC;
    state_5 : OUT STD_LOGIC;
    state_6 : OUT STD_LOGIC
);
END COMPONENT;

--Inputs
signal clk : STD_LOGIC := '0';
signal reset : STD_LOGIC := '0';
signal run : STD_LOGIC := '0';
signal step : STD_LOGIC := '0';
signal regSel : STD_LOGIC_VECTOR(2 DOWNTO 0) := (others => '0');

--Outputs
signal GPR : STD_LOGIC_VECTOR(15 downto 0);
signal regIC : STD_LOGIC_VECTOR(15 downto 0);
signal regIR : STD_LOGIC_VECTOR(15 downto 0);
signal regIDR : STD_LOGIC_VECTOR(15 downto 0);
signal regIACR : STD_LOGIC_VECTOR(15 downto 0);
signal regPACR : STD_LOGIC_VECTOR(15 downto 0);
signal regADR : STD_LOGIC_VECTOR(15 downto 0);
signal state_0 : STD_LOGIC;
signal state_1 : STD_LOGIC;
signal state_2 : STD_LOGIC;
signal state_3 : STD_LOGIC;
signal state_4 : STD_LOGIC;
signal state_5 : STD_LOGIC;
signal state_6 : STD_LOGIC;

-- Clock period definitions
constant clk_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: Main PORT MAP (
    clk => clk,
    reset => reset,
    run => run,
    step => step,
    regSel => regSel,
    GPR => GPR,
    regIC => regIC,
    regIR => regIR,
    regIDR => regIDR,
    regIACR => regIACR,
    regPACR => regPACR,
    regADR => regADR,
    state_0 => state_0,
    state_1 => state_1,
    state_2 => state_2,
    state_3 => state_3,
    state_4 => state_4,
    state_5 => state_5,
    state_6 => state_6
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
   run <= '1';
   step <= '0';
   wait for 100 ns;	
   
   reset <= '0';
   wait for clk_period*10;

   -- insert stimulus here 
   -- start <= '1';
   wait for clk_period*4;
   
   -- start <= '0';

    wait for 35 us;

end process;
    
END;
