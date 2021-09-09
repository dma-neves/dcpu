LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ControlUnit_test IS
END ControlUnit_test;

ARCHITECTURE behavior OF ControlUnit_test IS

COMPONENT ControlUnit
PORT(
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    start : IN STD_LOGIC;
    inst : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    IDR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    ZF : IN STD_LOGIC;
    NF : IN STD_LOGIC;
    OVF : IN STD_LOGIC;
    opc : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    RM_S : OUT STD_LOGIC;
    RXM_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    RYM_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ICM_S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AM_S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXM_S : OUT STD_LOGIC;
    DOM_S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AOM_S : OUT STD_LOGIC;
    RED_S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    IC_En : OUT STD_LOGIC;
    IR_En : OUT STD_LOGIC;
    IDR_En : OUT STD_LOGIC;
    ADR_En : OUT STD_LOGIC;
    FR_En : OUT STD_LOGIC;
    PACR_En : OUT STD_LOGIC;
    IACR_En : OUT STD_LOGIC;
    GPR_En : OUT STD_LOGIC;
    rw : OUT STD_LOGIC;
    fetch : OUT STD_LOGIC;
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
signal start : STD_LOGIC := '0';
signal inst : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');
signal IDR : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');
signal ZF : STD_LOGIC := '0';
signal NF : STD_LOGIC := '0';
signal OVF : STD_LOGIC := '0';

--Outputs
signal opc : STD_LOGIC_VECTOR(2 DOWNTO 0);
signal RM_S : STD_LOGIC;
signal RXM_S : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal RYM_S : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal ICM_S : STD_LOGIC_VECTOR(2 DOWNTO 0);
signal AM_S : STD_LOGIC_VECTOR(2 DOWNTO 0);
signal AXM_S : STD_LOGIC;
signal DOM_S : STD_LOGIC_VECTOR(2 DOWNTO 0);
signal AOM_S : STD_LOGIC;
signal RED_S : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal IC_En : STD_LOGIC;
signal IR_En : STD_LOGIC;
signal IDR_En : STD_LOGIC;
signal ADR_En : STD_LOGIC;
signal FR_En : STD_LOGIC;
signal PACR_En : STD_LOGIC;
signal IACR_En : STD_LOGIC;
signal GPR_En : STD_LOGIC;
signal rw : STD_LOGIC;
signal fetch : STD_LOGIC;
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
uut: ControlUnit PORT MAP (
    clk => clk,
    reset => reset,
    start => start,
    inst => inst,
    IDR => IDR,
    ZF => ZF,
    NF => NF,
    OVF => OVF,
    opc => opc,
    RM_S => RM_S,
    RXM_S => RXM_S,
    RYM_S => RYM_S,
    ICM_S => ICM_S,
    AM_S => AM_S,
    AXM_S => AXM_S,
    DOM_S => DOM_S,
    AOM_S => AOM_S,
    RED_S => RED_S,
    IC_En => IC_En,
    IR_En => IR_En,
    IDR_En => IDR_En,
    ADR_En => ADR_En,
    FR_En => FR_En,
    PACR_En => PACR_En,
    IACR_En => IACR_En,
    GPR_En => GPR_En,
    rw => rw,
    fetch => fetch,
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
    reset <= '1';
    start <= '0';
    inst <= "00000000";
    IDR <= "00000000";

    wait for 20 ns;
    
    reset <= '0';

    wait for 20 ns;

    start <= '1';

    wait for 20 ns;

    start <= '0';

    wait for 20 ns;

    IDR <= "00110010";

    wait for 80 ns;
end process;
    
END;
