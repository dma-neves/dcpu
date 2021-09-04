
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY CU_test IS
END CU_test;
 
ARCHITECTURE behavior OF CU_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         inst : IN  std_logic_vector(7 downto 0);
         ZF : IN  std_logic;
         NF : IN  std_logic;
         OVF : IN  std_logic;
         dataOut_S : OUT  std_logic_vector(2 downto 0);
         address_S : OUT  std_logic_vector(1 downto 0);
         opc : OUT  std_logic_vector(2 downto 0);
         ADR_S : OUT  std_logic_vector(1 downto 0);
         RA_S : OUT  std_logic_vector(1 downto 0);
         RB_S : OUT  std_logic;
         RC_S : OUT  std_logic;
         ALU_A_S : OUT  std_logic;
         ALU_B_S : OUT  std_logic_vector(1 downto 0);
         IC_S : OUT  std_logic_vector(1 downto 0);
         ADR_En : OUT  std_logic;
         RA_En : OUT  std_logic;
         RB_En : OUT  std_logic;
         RC_En : OUT  std_logic;
         IC_En : OUT  std_logic;
         IDR_En : OUT  std_logic;
         IR_En : OUT  std_logic;
         PACR_En : OUT  std_logic;
         IACR_En : OUT  std_logic;
         RW : OUT  std_logic;
         fetch : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal inst : std_logic_vector(7 downto 0) := (others => '0');
   signal ZF : std_logic := '0';
   signal NF : std_logic := '0';
   signal OVF : std_logic := '0';

 	--Outputs
   signal dataOut_S : std_logic_vector(2 downto 0);
   signal address_S : std_logic_vector(1 downto 0);
   signal opc : std_logic_vector(2 downto 0);
   signal ADR_S : std_logic_vector(1 downto 0);
   signal RA_S : std_logic_vector(1 downto 0);
   signal RB_S : std_logic;
   signal RC_S : std_logic;
   signal ALU_A_S : std_logic;
   signal ALU_B_S : std_logic_vector(1 downto 0);
   signal IC_S : std_logic_vector(1 downto 0);
   signal ADR_En : std_logic;
   signal RA_En : std_logic;
   signal RB_En : std_logic;
   signal RC_En : std_logic;
   signal IC_En : std_logic;
   signal IDR_En : std_logic;
   signal IR_En : std_logic;
   signal PACR_En : std_logic;
   signal IACR_En : std_logic;
   signal RW : std_logic;
   signal fetch : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          inst => inst,
          ZF => ZF,
          NF => NF,
          OVF => OVF,
          dataOut_S => dataOut_S,
          address_S => address_S,
          opc => opc,
          ADR_S => ADR_S,
          RA_S => RA_S,
          RB_S => RB_S,
          RC_S => RC_S,
          ALU_A_S => ALU_A_S,
          ALU_B_S => ALU_B_S,
          IC_S => IC_S,
          ADR_En => ADR_En,
          RA_En => RA_En,
          RB_En => RB_En,
          RC_En => RC_En,
          IC_En => IC_En,
          IDR_En => IDR_En,
          IR_En => IR_En,
          PACR_En => PACR_En,
          IACR_En => IACR_En,
          RW => RW,
          fetch => fetch
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

		reset <= '0';
      wait for clk_period*10;

      -- insert stimulus here 

		start <= '1';
		wait for 95 ns;
		
		start <= '0';
		wait for 5 ns;
		
		inst <= "00000000";
		wait for 70 ns;
		
		inst <= "00000001";
		wait for 70 ns;
		
		inst <= "00000010";
		wait for 70 ns;
		
		inst <= "00000011";
		wait for 70 ns;
		
		inst <= "00000100";
		wait for 70 ns;
		
		inst <= "00000101";
		wait for 70 ns;
		
   end process;

END;
