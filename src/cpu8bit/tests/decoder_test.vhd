LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY decoder_test IS
END decoder_test;
 
ARCHITECTURE behavior OF decoder_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         inst : IN  std_logic_vector(7 downto 0);
         En : IN  std_logic;
         add_RA_RB : OUT  std_logic;
         add_RA_X : OUT  std_logic;
         sub_RA_RB : OUT  std_logic;
         sub_RA_X : OUT  std_logic;
         inc_RA : OUT  std_logic;
         dec_RA : OUT  std_logic;
         neg_RA : OUT  std_logic;
         not_RA : OUT  std_logic;
         and_RA_RB : OUT  std_logic;
         or_RA_RB : OUT  std_logic;
         lod_adr_RA : OUT  std_logic;
         str_RA_adr : OUT  std_logic;
         lod_adr_RB : OUT  std_logic;
         str_RB_adr : OUT  std_logic;
         lod_adr_RC : OUT  std_logic;
         str_RC_adr : OUT  std_logic;
         lod_ACR_RA : OUT  std_logic;
         str_ACR_adr : OUT  std_logic;
         jmp_X : OUT  std_logic;
         jmpz_X : OUT  std_logic;
         jmpn_X : OUT  std_logic;
         jmpo_X : OUT  std_logic;
         hlt : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inst : std_logic_vector(7 downto 0) := (others => '0');
   signal En : std_logic := '0';

 	--Outputs
   signal add_RA_RB : std_logic;
   signal add_RA_X : std_logic;
   signal sub_RA_RB : std_logic;
   signal sub_RA_X : std_logic;
   signal inc_RA : std_logic;
   signal dec_RA : std_logic;
   signal neg_RA : std_logic;
   signal not_RA : std_logic;
   signal and_RA_RB : std_logic;
   signal or_RA_RB : std_logic;
   signal lod_adr_RA : std_logic;
   signal str_RA_adr : std_logic;
   signal lod_adr_RB : std_logic;
   signal str_RB_adr : std_logic;
   signal lod_adr_RC : std_logic;
   signal str_RC_adr : std_logic;
   signal lod_ACR_RA : std_logic;
   signal str_ACR_adr : std_logic;
   signal jmp_X : std_logic;
   signal jmpz_X : std_logic;
   signal jmpn_X : std_logic;
   signal jmpo_X : std_logic;
   signal hlt : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          inst => inst,
          En => En,
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
          hlt => hlt
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
		
		En <= '0';
		inst <= "00000010";
		wait for 100 ns;
		
		inst <= "00000000";
		En <= '1';
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

      wait;
   end process;

END;
