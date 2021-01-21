LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY opDecoder_test IS
END opDecoder_test;
 
ARCHITECTURE behavior OF opDecoder_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OpDecoder
    PORT(
         En : IN  std_logic;
         ZF : IN  std_logic;
         NF : IN  std_logic;
         OVF : IN  std_logic;
         add_RA_RB : IN  std_logic;
         add_RA_X : IN  std_logic;
         sub_RA_RB : IN  std_logic;
         sub_RA_X : IN  std_logic;
         inc_RA : IN  std_logic;
         dec_RA : IN  std_logic;
         neg_RA : IN  std_logic;
         not_RA : IN  std_logic;
         and_RA_RB : IN  std_logic;
         or_RA_RB : IN  std_logic;
         lod_adr_RA : IN  std_logic;
         str_RA_adr : IN  std_logic;
         lod_adr_RB : IN  std_logic;
         str_RB_adr : IN  std_logic;
         lod_adr_RC : IN  std_logic;
         str_RC_adr : IN  std_logic;
         lod_ACR_RA : IN  std_logic;
         str_ACR_adr : IN  std_logic;
         jmp_X : IN  std_logic;
         jmpz_X : IN  std_logic;
         jmpn_X : IN  std_logic;
         jmpo_X : IN  std_logic;
         hlt : IN  std_logic;
         dataOut_S : OUT  std_logic_vector(1 downto 0);
         dataIn_S : OUT  std_logic_vector(1 downto 0);
         opc : OUT  std_logic_vector(2 downto 0);
         adr_S : OUT  std_logic;
         RA_S : OUT  std_logic;
         RB_S : OUT  std_logic;
         ALU_A_S : OUT  std_logic;
         IC_S : OUT  std_logic;
         RA_En : OUT  std_logic;
         RB_En : OUT  std_logic;
         RC_En : OUT  std_logic;
         IC_En : OUT  std_logic;
         IDR_En : OUT  std_logic;
         IR_En : OUT  std_logic;
         ACR_En : OUT  std_logic;
         RW : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal En : std_logic := '0';
   signal ZF : std_logic := '0';
   signal NF : std_logic := '0';
   signal OVF : std_logic := '0';
   signal add_RA_RB : std_logic := '0';
   signal add_RA_X : std_logic := '0';
   signal sub_RA_RB : std_logic := '0';
   signal sub_RA_X : std_logic := '0';
   signal inc_RA : std_logic := '0';
   signal dec_RA : std_logic := '0';
   signal neg_RA : std_logic := '0';
   signal not_RA : std_logic := '0';
   signal and_RA_RB : std_logic := '0';
   signal or_RA_RB : std_logic := '0';
   signal lod_adr_RA : std_logic := '0';
   signal str_RA_adr : std_logic := '0';
   signal lod_adr_RB : std_logic := '0';
   signal str_RB_adr : std_logic := '0';
   signal lod_adr_RC : std_logic := '0';
   signal str_RC_adr : std_logic := '0';
   signal lod_ACR_RA : std_logic := '0';
   signal str_ACR_adr : std_logic := '0';
   signal jmp_X : std_logic := '0';
   signal jmpz_X : std_logic := '0';
   signal jmpn_X : std_logic := '0';
   signal jmpo_X : std_logic := '0';
   signal hlt : std_logic := '0';

 	--Outputs
   signal dataOut_S : std_logic_vector(1 downto 0);
   signal dataIn_S : std_logic_vector(1 downto 0);
   signal opc : std_logic_vector(2 downto 0);
   signal adr_S : std_logic;
   signal RA_S : std_logic;
   signal RB_S : std_logic;
   signal ALU_A_S : std_logic;
   signal IC_S : std_logic;
   signal RA_En : std_logic;
   signal RB_En : std_logic;
   signal RC_En : std_logic;
   signal IC_En : std_logic;
   signal IDR_En : std_logic;
   signal IR_En : std_logic;
   signal ACR_En : std_logic;
   signal RW : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OpDecoder PORT MAP (
          En => En,
          ZF => ZF,
          NF => NF,
          OVF => OVF,
          add_RA_RB => add_RA_RB,
          add_RA_X => add_RA_X,
          sub_RA_RB => sub_RA_RB,
          sub_RA_X => sub_RA_X,
          inc_RA => inc_RA,
          dec_RA => dec_RA,
          neg_RA => neg_RA,
          not_RA => not_RA,
          and_RA_RB => and_RA_RB,
          or_RA_RB => or_RA_RB,
          lod_adr_RA => lod_adr_RA,
          str_RA_adr => str_RA_adr,
          lod_adr_RB => lod_adr_RB,
          str_RB_adr => str_RB_adr,
          lod_adr_RC => lod_adr_RC,
          str_RC_adr => str_RC_adr,
          lod_ACR_RA => lod_ACR_RA,
          str_ACR_adr => str_ACR_adr,
          jmp_X => jmp_X,
          jmpz_X => jmpz_X,
          jmpn_X => jmpn_X,
          jmpo_X => jmpo_X,
          hlt => hlt,
          dataOut_S => dataOut_S,
          dataIn_S => dataIn_S,
          opc => opc,
          adr_S => adr_S,
          RA_S => RA_S,
          RB_S => RB_S,
          ALU_A_S => ALU_A_S,
          IC_S => IC_S,
          RA_En => RA_En,
          RB_En => RB_En,
          RC_En => RC_En,
          IC_En => IC_En,
          IDR_En => IDR_En,
          IR_En => IR_En,
          ACR_En => ACR_En,
          RW => RW
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		En <= '1';
		ZF <= '1';
		NF <= '1';
		OVF <= '1';
      wait for 100 ns;	

      -- insert stimulus here
		add_RA_RB <= '1'; wait for 100 ns; add_RA_RB <= '0';
		add_RA_X <= '1'; wait for 100 ns; add_RA_X <= '0';
		sub_RA_RB <= '1'; wait for 100 ns; sub_RA_RB <= '0';
		sub_RA_X <= '1'; wait for 100 ns; sub_RA_X <= '0';
		inc_RA <= '1'; wait for 100 ns; inc_RA <= '0';
		dec_RA <= '1'; wait for 100 ns; dec_RA <= '0';
		neg_RA <= '1'; wait for 100 ns; neg_RA <= '0';
		not_RA <= '1'; wait for 100 ns; not_RA <= '0';
		and_RA_RB <= '1'; wait for 100 ns; and_RA_RB <= '0';
		or_RA_RB <= '1'; wait for 100 ns; or_RA_RB <= '0';
		lod_adr_RA <= '1'; wait for 100 ns; lod_adr_RA <= '0';
		str_RA_adr <= '1'; wait for 100 ns; str_RA_adr <= '0';
		lod_adr_RB <= '1'; wait for 100 ns; lod_adr_RB <= '0';
		str_RB_adr <= '1'; wait for 100 ns; str_RB_adr <= '0';
		lod_adr_RC <= '1'; wait for 100 ns; lod_adr_RC <= '0';
		str_RC_adr <= '1'; wait for 100 ns; str_RC_adr <= '0';
		lod_ACR_RA <= '1'; wait for 100 ns; lod_ACR_RA <= '0';
		str_ACR_adr <= '1'; wait for 100 ns; str_ACR_adr <= '0';
		jmp_X <= '1'; wait for 100 ns; jmp_X <= '0';
		jmpz_X <= '1'; wait for 100 ns; jmpz_X <= '0';
		jmpn_X <= '1'; wait for 100 ns; jmpn_X <= '0';
		jmpo_X <= '1'; wait for 100 ns; jmpo_X <= '0';
		hlt <= '1'; wait for 100 ns; hlt <= '0';

      wait;
   end process;

END;
