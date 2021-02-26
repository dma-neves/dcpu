library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OpDecoder is
Port(
	
	En : in STD_LOGIC;
	ZF, NF, OVF : in STD_LOGIC;

	add_RA_RB,
	add_RA_RC,
	add_RA_X,
	sub_RA_RB,
	sub_RA_RC,
	sub_RA_X,
	inc_RA,
	dec_RA,
	neg_RA,
	not_RA,
	and_RA_RB,
	and_RA_RC,
	or_RA_RB,
	or_RA_RC,	
	
	lod_X_RA,
	lod_X_RB,
	lod_X_RC,
	lod_X_ADR,
	
	str_X_mADR,
	lod_adr_ADR,
	
	lod_mADR_RA,
	str_RA_mADR,
	lod_mADR_RB,
	str_RB_mADR,
	lod_mADR_RC,
	str_RC_mADR,
	
	lod_ACR_RA,
	lod_ACR_ADR,
	str_ACR_mADR,

	jmp_adr,
	jmpz_adr,
	jmpn_adr,
	jmpo_adr : in STD_LOGIC;
	
	dataOut_S : out STD_LOGIC_VECTOR(2 downto 0);
	address_S : out STD_LOGIC_VECTOR(1 downto 0);
	opc : out STD_LOGIC_VECTOR(2 downto 0);
	
	ADR_S : out STD_LOGIC_VECTOR(1 downto 0);
	RA_S : out STD_LOGIC_VECTOR(1 downto 0);
	RB_S : out STD_LOGIC;
	RC_S : out STD_LOGIC;
	ALU_A_S : out STD_LOGIC;
	ALU_B_S : out STD_LOGIC_VECTOR(1 downto 0);
	IC_S,
	ADR_En,
	RA_En,
	RB_En,
	RC_En,
	IC_En,
	IDR_En,
	IR_En,
	ACR_En,
	RW : out STD_LOGIC
);
end OpDecoder;

architecture Behavioral of OpDecoder is

begin

	ALU_A_S <= '0';
	IDR_En <= '0';
	IR_En <= '0';
	ACR_En <= En and (add_RA_RB or add_RA_RC or add_RA_X or sub_RA_RB or sub_RA_RC or sub_RA_X or inc_RA or dec_RA or neg_RA or not_RA or and_RA_RB or and_RA_RC or or_RA_RB or or_RA_RC);
	ALU_B_S(0) <= En and (add_RA_RC or sub_RA_RC or and_RA_RC or or_RA_RC);
	ALU_B_S(1) <= En and (add_RA_X or sub_RA_X);
	opc(0) <= En and (sub_RA_RB or sub_RA_RC or sub_RA_X or dec_RA or not_RA or or_RA_RB or or_RA_RC);
	opc(1) <= En and (inc_RA or dec_RA or and_RA_RB or and_RA_RC or or_RA_RB or or_RA_RC);
	opc(2) <= En and (neg_RA or not_RA or and_RA_RB or and_RA_RC or or_RA_RB or or_RA_RC);
	RA_S(0) <= En and (lod_mADR_RA);
	RA_S(1) <= En and (lod_X_RA);
	RA_En <= En and (lod_X_RA or lod_mADR_RA or lod_ACR_RA);
	RB_S <= En and (lod_X_RB);
	RB_En <= En and (lod_X_RB or lod_mADR_RB);
	RC_S <= En and (lod_X_RC);
	RC_En <= En and (lod_X_RC or lod_mADR_RC);
	ADR_S(0) <= En and (lod_X_ADR);
	ADR_S(1) <= En and (lod_ACR_ADR);
	ADR_En <= En and (lod_X_ADR or lod_adr_ADR or lod_ACR_ADR);
	address_S(0) <= En and (lod_adr_ADR);
	address_S(1) <= En and (str_X_mADR or lod_mADR_RA or str_RA_mADR or lod_mADR_RB or str_RB_mADR or lod_mADR_RC or str_RC_mADR or str_ACR_mADR);
	dataOut_S(2) <= En and (str_X_mADR);
	RW <= En and (str_X_mADR or str_RA_mADR or str_RB_mADR or str_RC_mADR or str_ACR_mADR);
	dataOut_S(0) <= En and (str_RB_mADR or str_ACR_mADR);
	dataOut_S(1) <= En and (str_RA_mADR or str_ACR_mADR);
	IC_S <= En and (jmp_adr or (jmpz_adr and ZF) or (jmpn_adr and NF) or (jmpo_adr and OVF));
	IC_En <= En and (jmp_adr or (jmpz_adr and ZF) or (jmpn_adr and NF) or (jmpo_adr and OVF));
	
end Behavioral;

