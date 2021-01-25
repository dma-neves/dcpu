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
	lod_adr_RA,
	str_RA_adr,
	lod_adr_RB,
	str_RB_adr,
	lod_adr_RC,
	str_RC_adr,
	lod_ACR_RA,
	str_ACR_adr,
	jmp_X,
	jmpz_X,
	jmpn_X,
	jmpo_X,
	hlt : in STD_LOGIC;
	
	dataOut_S : out STD_LOGIC_VECTOR(1 downto 0);
	dataIn_S : out STD_LOGIC_VECTOR(2 downto 0);
	opc : out STD_LOGIC_VECTOR(2 downto 0);
	
	adr_S,
	RA_S,
	ALU_A_S : out STD_LOGIC;
	ALU_B_S : out STD_LOGIC_VECTOR(1 downto 0);
	IC_S,
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

	dataOut_S(0) <= En and ( str_RB_adr or str_ACR_adr );
	dataOut_S(1) <= En and ( str_RA_adr or str_ACR_adr );
	
	dataIn_S(0) <= En and ( lod_adr_RB );
	dataIn_S(1) <= En and ( lod_adr_RC );
	dataIn_S(2) <= '0';
	
	opc(0) <= En and ( sub_RA_RB or sub_RA_X or dec_RA or not_RA or or_RA_RB or or_RA_RC or sub_RA_RC );
	opc(1) <= En and ( inc_RA or dec_RA or and_RA_RB or or_RA_RB or or_RA_RC or and_RA_RC);
	opc(2) <= En and ( neg_RA or not_RA or and_RA_RB or or_RA_RB or or_RA_RC or and_RA_RC );
	
	adr_S <= En and ( lod_adr_RA or str_RA_adr or lod_adr_RB or str_RB_adr or lod_adr_RC or str_RC_adr or str_ACR_adr );
	RA_S <= En and ( lod_adr_RA );
	ALU_A_S <= En and ( '0' );
	ALU_B_S(0) <= En and ( add_RA_RC or sub_RA_RC or and_RA_RC or or_RA_RC );
	ALU_B_S(1) <= En and ( add_RA_X or sub_RA_X );
	IC_S <= En and ( jmp_X or (jmpn_X and NF) or (jmpz_X and ZF) or (jmpo_X and OVF) );
	RA_En <= En and ( lod_adr_RA or lod_ACR_RA );
	RB_En <= En and ( lod_adr_RB );
	RC_En <= En and ( lod_adr_RC );
	IC_En <= En and ( jmp_X or (jmpn_X and NF) or (jmpz_X and ZF) or (jmpo_X and OVF) );
	IDR_En <= En and ( '0' );
	IR_En <= En and ( '0' );
	ACR_En <= En and ( add_RA_RB or add_RA_RC or add_RA_X or sub_RA_RB or sub_RA_RC or sub_RA_X or 
							 inc_RA or dec_RA or neg_RA or not_RA or and_RA_RB or and_RA_RC or or_RA_RB or or_RA_RC );
	RW <= En and ( str_RA_adr or str_RB_adr or str_RC_adr or str_ACR_adr );
	
end Behavioral;

