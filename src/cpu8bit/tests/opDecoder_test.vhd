
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
         add_RA_RC : IN  std_logic;
         add_RA_X : IN  std_logic;
         sub_RA_RB : IN  std_logic;
         sub_RA_RC : IN  std_logic;
         sub_RA_X : IN  std_logic;
         inc_RA : IN  std_logic;
         dec_RA : IN  std_logic;
         neg_RA : IN  std_logic;
         not_RA : IN  std_logic;
         and_RA_RB : IN  std_logic;
         and_RA_RC : IN  std_logic;
         or_RA_RB : IN  std_logic;
         or_RA_RC : IN  std_logic;
         lod_X_RA : IN  std_logic;
         lod_X_RB : IN  std_logic;
         lod_X_RC : IN  std_logic;
         lod_X_ADR : IN  std_logic;
         str_X_mADR : IN  std_logic;
         lod_adr_ADR : IN  std_logic;
         lod_mADR_RA : IN  std_logic;
         str_RA_mADR : IN  std_logic;
         lod_mADR_RB : IN  std_logic;
         str_RB_mADR : IN  std_logic;
         lod_mADR_RC : IN  std_logic;
         str_RC_mADR : IN  std_logic;
         lod_ACR_RA : IN  std_logic;
         lod_ACR_ADR : IN  std_logic;
         str_ACR_mADR : IN  std_logic;
         str_IC_mADR : IN  std_logic;
         jmp_ADR : IN  std_logic;
         jmp_x : IN  std_logic;
         jmpz_x : IN  std_logic;
         jmpn_x : IN  std_logic;
         jmpo_x : IN  std_logic;
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
   signal add_RA_RC : std_logic := '0';
   signal add_RA_X : std_logic := '0';
   signal sub_RA_RB : std_logic := '0';
   signal sub_RA_RC : std_logic := '0';
   signal sub_RA_X : std_logic := '0';
   signal inc_RA : std_logic := '0';
   signal dec_RA : std_logic := '0';
   signal neg_RA : std_logic := '0';
   signal not_RA : std_logic := '0';
   signal and_RA_RB : std_logic := '0';
   signal and_RA_RC : std_logic := '0';
   signal or_RA_RB : std_logic := '0';
   signal or_RA_RC : std_logic := '0';
   signal lod_X_RA : std_logic := '0';
   signal lod_X_RB : std_logic := '0';
   signal lod_X_RC : std_logic := '0';
   signal lod_X_ADR : std_logic := '0';
   signal str_X_mADR : std_logic := '0';
   signal lod_adr_ADR : std_logic := '0';
   signal lod_mADR_RA : std_logic := '0';
   signal str_RA_mADR : std_logic := '0';
   signal lod_mADR_RB : std_logic := '0';
   signal str_RB_mADR : std_logic := '0';
   signal lod_mADR_RC : std_logic := '0';
   signal str_RC_mADR : std_logic := '0';
   signal lod_ACR_RA : std_logic := '0';
   signal lod_ACR_ADR : std_logic := '0';
   signal str_ACR_mADR : std_logic := '0';
   signal str_IC_mADR : std_logic := '0';
   signal jmp_ADR : std_logic := '0';
   signal jmp_x : std_logic := '0';
   signal jmpz_x : std_logic := '0';
   signal jmpn_x : std_logic := '0';
   signal jmpo_x : std_logic := '0';

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
          add_RA_RC => add_RA_RC,
          add_RA_X => add_RA_X,
          sub_RA_RB => sub_RA_RB,
          sub_RA_RC => sub_RA_RC,
          sub_RA_X => sub_RA_X,
          inc_RA => inc_RA,
          dec_RA => dec_RA,
          neg_RA => neg_RA,
          not_RA => not_RA,
          and_RA_RB => and_RA_RB,
          and_RA_RC => and_RA_RC,
          or_RA_RB => or_RA_RB,
          or_RA_RC => or_RA_RC,
          lod_X_RA => lod_X_RA,
          lod_X_RB => lod_X_RB,
          lod_X_RC => lod_X_RC,
          lod_X_ADR => lod_X_ADR,
          str_X_mADR => str_X_mADR,
          lod_adr_ADR => lod_adr_ADR,
          lod_mADR_RA => lod_mADR_RA,
          str_RA_mADR => str_RA_mADR,
          lod_mADR_RB => lod_mADR_RB,
          str_RB_mADR => str_RB_mADR,
          lod_mADR_RC => lod_mADR_RC,
          str_RC_mADR => str_RC_mADR,
          lod_ACR_RA => lod_ACR_RA,
          lod_ACR_ADR => lod_ACR_ADR,
          str_ACR_mADR => str_ACR_mADR,
          str_IC_mADR => str_IC_mADR,
          jmp_ADR => jmp_ADR,
          jmp_x => jmp_x,
          jmpz_x => jmpz_x,
          jmpn_x => jmpn_x,
          jmpo_x => jmpo_x,
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
          ACR_En => ACR_En,
          RW => RW
        );


   -- Stimulus process
   stim_proc: process
   begin		
	
		En <= '1';
		ZF <= '1';
		NF <= '1';
		OVF <= '1';
		
		 add_RA_RB <= '1'; wait for 100 ns; add_RA_RB <= '0';
		 add_RA_RC <= '1'; wait for 100 ns; add_RA_RC <= '0';
		 add_RA_X <= '1'; wait for 100 ns; add_RA_X <= '0';
		 sub_RA_RB <= '1'; wait for 100 ns; sub_RA_RB <= '0';
		 sub_RA_RC <= '1'; wait for 100 ns; sub_RA_RC <= '0';
		 sub_RA_X <= '1'; wait for 100 ns; sub_RA_X <= '0';
		 inc_RA <= '1'; wait for 100 ns; inc_RA <= '0';
		 dec_RA <= '1'; wait for 100 ns; dec_RA <= '0';
		 neg_RA <= '1'; wait for 100 ns; neg_RA <= '0';
		 not_RA <= '1'; wait for 100 ns; not_RA <= '0';
		 and_RA_RB <= '1'; wait for 100 ns; and_RA_RB <= '0';
		 and_RA_RC <= '1'; wait for 100 ns; and_RA_RC <= '0';
		 or_RA_RB <= '1'; wait for 100 ns; or_RA_RB <= '0';
		 or_RA_RC <= '1'; wait for 100 ns; or_RA_RC <= '0';
		 lod_X_RA <= '1'; wait for 100 ns; lod_X_RA <= '0';
		 lod_X_RB <= '1'; wait for 100 ns; lod_X_RB <= '0';
		 lod_X_RC <= '1'; wait for 100 ns; lod_X_RC <= '0';
		 lod_X_ADR <= '1'; wait for 100 ns; lod_X_ADR <= '0';
		 str_X_mADR <= '1'; wait for 100 ns; str_X_mADR <= '0';
		 lod_adr_ADR <= '1'; wait for 100 ns; lod_adr_ADR <= '0';
		 lod_mADR_RA <= '1'; wait for 100 ns; lod_mADR_RA <= '0';
		 str_RA_mADR <= '1'; wait for 100 ns; str_RA_mADR <= '0';
		 lod_mADR_RB <= '1'; wait for 100 ns; lod_mADR_RB <= '0';
		 str_RB_mADR <= '1'; wait for 100 ns; str_RB_mADR <= '0';
		 lod_mADR_RC <= '1'; wait for 100 ns; lod_mADR_RC <= '0';
		 str_RC_mADR <= '1'; wait for 100 ns; str_RC_mADR <= '0';
		 lod_ACR_RA <= '1'; wait for 100 ns; lod_ACR_RA <= '0';
		 lod_ACR_ADR <= '1'; wait for 100 ns; lod_ACR_ADR <= '0';
		 str_ACR_mADR <= '1'; wait for 100 ns; str_ACR_mADR <= '0';
		 str_IC_mADR <= '1'; wait for 100 ns; str_IC_mADR <= '0';
		 jmp_ADR <= '1'; wait for 100 ns; jmp_ADR <= '0';
		 jmp_x <= '1'; wait for 100 ns; jmp_x <= '0';
		 jmpz_x <= '1'; wait for 100 ns; jmpz_x <= '0';
		 jmpn_x <= '1'; wait for 100 ns; jmpn_x <= '0';
		 jmpo_x <= '1'; wait for 100 ns; jmpo_x <= '0';		

      wait;
   end process;

END;
