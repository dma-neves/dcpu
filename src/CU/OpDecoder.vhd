library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OpDecoder is
Port(
	
	En : in STD_LOGIC;
	ZF, NF, OVF : in STD_LOGIC;
	IDR_l, IDR_h : STD_LOGIC_VECTOR(7 downto 0);

	add_RX_RY,
	sub_RX_RY,
	ssp_V,
	inc_RX,
	dec_RX,
	neg_RX,
	not_RX,
	and_RX_RY,
	or_RX_RY,
	lod_V_ADR,
	str_V_mADR,
	lod_mADR_RX,
	str_RX_mADR,
	lod_RX_ADR,
	lod_ACR_RX,
	lod_ACR_ADR,
	str_ACR_mADR,
	str_IC_mADR,
	jmp_ADR,
	jmp_X,
	jmpz_X,
	jmpn_X,
	jmpo_X,
	hlt : in STD_LOGIC;

	opc : OUT STD_LOGIC_VECTOR(2 downto 0);
	RM_S : OUT STD_LOGIC;
	RXM_S : OUT STD_LOGIC_VECTOR(2 downto 0);
	RYM_S : OUT STD_LOGIC_VECTOR(2 downto 0);
	ICM_S : OUT STD_LOGIC_VECTOR(1 downto 0);
	AM_S : OUT STD_LOGIC_VECTOR(1 downto 0);
	AXM_S : OUT STD_LOGIC;
	AYM_S : OUT STD_LOGIC;
	DOM_S : OUT STD_LOGIC_VECTOR(1 downto 0);
	AOM_S : OUT STD_LOGIC;
	RED_S : OUT STD_LOGIC_VECTOR(2 downto 0);
	IC_En,
	IR_En,
	IDR_En,
	ADR_En,
	ACR_En,
	GPR_En : OUT STD_LOGIC;
	rw : OUT STD_LOGIC
);
end OpDecoder;

architecture Behavioral of OpDecoder is

component Mux2_8b is
Port(
	I0, I1 : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC;
	o : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

signal RXM_S_8b : STD_LOGIC_VECTOR(7 downto 0);

begin

	ACR_En <= En and (add_RX_RY or sub_RX_RY or ssp_V or inc_RX or dec_RX or neg_RX or not_RX or and_RX_RY or or_RX_RY);
	opc(0) <= En and (sub_RX_RY or ssp_V or dec_RX or not_RX or or_RX_RY);
	AYM_S <= En and (ssp_V);
	opc(1) <= En and (inc_RX or dec_RX or and_RX_RY or or_RX_RY);
	opc(2) <= En and (neg_RX or not_RX or and_RX_RY or or_RX_RY);
	AM_S(1) <= En and (lod_V_ADR);
	ADR_En <= En and (lod_V_ADR or lod_RX_ADR or lod_ACR_ADR);
	DOM_S(0) <= En and (str_V_mADR or str_IC_mADR);
	DOM_S(1) <= En and (str_V_mADR or str_ACR_mADR);
	AOM_S <= En and (str_V_mADR or lod_mADR_RX or str_RX_mADR or str_ACR_mADR or str_IC_mADR);
	rw <= En and (str_V_mADR or str_RX_mADR or str_ACR_mADR or str_IC_mADR);
	RM_S <= En and (lod_mADR_RX);
	GPR_En <= En and (lod_mADR_RX or lod_ACR_RX);
	AM_S(0) <= En and (lod_ACR_ADR);
	ICM_S(1) <= En and (jmp_ADR);
	IC_En <= En and (jmp_ADR or jmp_X or (jmpz_X and ZF) or (jmpn_X and NF) or (jmpo_X and OVF));
	ICM_S(0) <= En and (jmp_X or (jmpz_X and ZF) or (jmpn_X and NF) or (jmpo_X and OVF));	
	
	RXM_S <= RXM_S_8b(2 downto 0);
	RYM_S <= IDR_h(2 downto 0);
	RED_S <= IDR_l(2 downto 0);


	RX_MUX: Mux2_8b port map (
		I0 => IDR_l,
		I1 => "00000111",
		sel => ssp_V,
		o => RXM_S_8b
	);

	AXM_S <= '0';
	IDR_En <= '0';
	IR_En <= '0';
	
end Behavioral;

