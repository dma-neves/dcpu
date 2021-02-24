
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY InstDecoder_test IS
END InstDecoder_test;
 
ARCHITECTURE behavior OF InstDecoder_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstDecoder
    PORT(
         inst : IN  std_logic_vector(7 downto 0);
         add_RA_RB : OUT  std_logic;
         add_RA_RC : OUT  std_logic;
         add_RA_X : OUT  std_logic;
         sub_RA_RB : OUT  std_logic;
         sub_RA_RC : OUT  std_logic;
         sub_RA_X : OUT  std_logic;
         inc_RA : OUT  std_logic;
         dec_RA : OUT  std_logic;
         neg_RA : OUT  std_logic;
         not_RA : OUT  std_logic;
         and_RA_RB : OUT  std_logic;
         and_RA_RC : OUT  std_logic;
         or_RA_RB : OUT  std_logic;
         or_RA_RC : OUT  std_logic;
         lod_X_RA : OUT  std_logic;
         lod_X_RB : OUT  std_logic;
         lod_X_RC : OUT  std_logic;
         lod_X_ADR : OUT  std_logic;
         lod_X_mADR : OUT  std_logic;
         lod_adr_ADR : OUT  std_logic;
         lod_mADR_RA : OUT  std_logic;
         str_RA_mADR : OUT  std_logic;
         lod_mADR_RB : OUT  std_logic;
         str_RB_mADR : OUT  std_logic;
         lod_mADR_RC : OUT  std_logic;
         str_RC_mADR : OUT  std_logic;
         lod_ACR_RA : OUT  std_logic;
         lod_ACR_ADR : OUT  std_logic;
         str_ACR_mADR : OUT  std_logic;
         jmp_adr : OUT  std_logic;
         jmpz_adr : OUT  std_logic;
         jmpn_adr : OUT  std_logic;
         jmpo_adr : OUT  std_logic;
         hlt : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inst : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal add_RA_RB : std_logic;
   signal add_RA_RC : std_logic;
   signal add_RA_X : std_logic;
   signal sub_RA_RB : std_logic;
   signal sub_RA_RC : std_logic;
   signal sub_RA_X : std_logic;
   signal inc_RA : std_logic;
   signal dec_RA : std_logic;
   signal neg_RA : std_logic;
   signal not_RA : std_logic;
   signal and_RA_RB : std_logic;
   signal and_RA_RC : std_logic;
   signal or_RA_RB : std_logic;
   signal or_RA_RC : std_logic;
   signal lod_X_RA : std_logic;
   signal lod_X_RB : std_logic;
   signal lod_X_RC : std_logic;
   signal lod_X_ADR : std_logic;
   signal lod_X_mADR : std_logic;
   signal lod_adr_ADR : std_logic;
   signal lod_mADR_RA : std_logic;
   signal str_RA_mADR : std_logic;
   signal lod_mADR_RB : std_logic;
   signal str_RB_mADR : std_logic;
   signal lod_mADR_RC : std_logic;
   signal str_RC_mADR : std_logic;
   signal lod_ACR_RA : std_logic;
   signal lod_ACR_ADR : std_logic;
   signal str_ACR_mADR : std_logic;
   signal jmp_adr : std_logic;
   signal jmpz_adr : std_logic;
   signal jmpn_adr : std_logic;
   signal jmpo_adr : std_logic;
   signal hlt : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstDecoder PORT MAP (
          inst => inst,
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
          lod_X_mADR => lod_X_mADR,
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
          jmp_adr => jmp_adr,
          jmpz_adr => jmpz_adr,
          jmpn_adr => jmpn_adr,
          jmpo_adr => jmpo_adr,
          hlt => hlt
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
		
		inst <= "00000000";
		wait for 100 ns;
		inst <= "00000001";
		wait for 100 ns;
		inst <= "00000010";
		wait for 100 ns;
		inst <= "00000011";
		wait for 100 ns;
		inst <= "00000100";
		wait for 100 ns;
		inst <= "00000101";
		wait for 100 ns;
		inst <= "00000110";
		wait for 100 ns;
		inst <= "00000111";
		wait for 100 ns;
		inst <= "00001000";
		wait for 100 ns;
		inst <= "00001001";
		wait for 100 ns;
		inst <= "00001010";
		wait for 100 ns;
		inst <= "00001011";
		wait for 100 ns;
		inst <= "00001100";
		wait for 100 ns;
		inst <= "00001101";
		wait for 100 ns;
		inst <= "00001110";
		wait for 100 ns;
		inst <= "00001111";
		wait for 100 ns;
		inst <= "00010000";
		wait for 100 ns;
		inst <= "00010001";
		wait for 100 ns;
		inst <= "00010010";
		wait for 100 ns;
		inst <= "00010011";
		wait for 100 ns;
		inst <= "00010100";
		wait for 100 ns;
		inst <= "00010101";
		wait for 100 ns;
		inst <= "00010110";
		wait for 100 ns;
		inst <= "00010111";
		wait for 100 ns;
		inst <= "00011000";
		wait for 100 ns;
		inst <= "00011001";
		wait for 100 ns;
		inst <= "00011010";
		wait for 100 ns;
		inst <= "00011011";
		wait for 100 ns;
		inst <= "00011100";
		wait for 100 ns;
		inst <= "00011101";
		wait for 100 ns;
		inst <= "00011110";
		wait for 100 ns;
		inst <= "00011111";
		wait for 100 ns;
		inst <= "00100000";
		wait for 100 ns;
		inst <= "00100001";
		wait for 100 ns;

      wait;
   end process;

END;
