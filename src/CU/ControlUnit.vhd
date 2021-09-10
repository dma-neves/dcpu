library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
Port(
	clk, reset : in STD_LOGIC;
	inst : in STD_LOGIC_VECTOR(7 downto 0);
	IDR : in STD_LOGIC_VECTOR(7 downto 0);
	ZF, NF, OVF : in STD_LOGIC;

	opc : OUT STD_LOGIC_VECTOR(2 downto 0);
	RM_S : OUT STD_LOGIC;
	RXM_S : OUT STD_LOGIC_VECTOR(3 downto 0);
	RYM_S : OUT STD_LOGIC_VECTOR(3 downto 0);
	ICM_S : OUT STD_LOGIC_VECTOR(2 downto 0);
	AM_S : OUT STD_LOGIC_VECTOR(2 downto 0);
	AXM_S : OUT STD_LOGIC;
	DOM_S : OUT STD_LOGIC_VECTOR(2 downto 0);
	AOM_S : OUT STD_LOGIC;
	RED_S : OUT STD_LOGIC_VECTOR(3 downto 0);
	IC_En,
	IR_En,
	IDR_En,
	ADR_En,
	FR_En,
	PACR_En,
	IACR_En,
	GPR_En : OUT STD_LOGIC;

	rw : out STD_LOGIC;
	fetch : out STD_LOGIC;
	
	state_0,
	state_1,
	state_2,
	state_3,
	state_4,
	state_5,
	state_6 : out STD_LOGIC
);
end ControlUnit;

architecture Behavioral of ControlUnit is

-- components

component SevenState_sm is
port(
	clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	
	S0, S1, S2, S3, S4, S5, S6 : out STD_LOGIC
);
end component;

component InstDecoder is
Port(
	inst : in STD_LOGIC_VECTOR(7 downto 0);

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
	hlt : out STD_LOGIC
);
end component;

component OpDecoder is
Port(
	En : in STD_LOGIC;
	ZF, NF, OVF : in STD_LOGIC;
	IDR_l, IDR_h : STD_LOGIC_VECTOR(3 downto 0);

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
	RXM_S : OUT STD_LOGIC_VECTOR(3 downto 0);
	RYM_S : OUT STD_LOGIC_VECTOR(3 downto 0);
	ICM_S : OUT STD_LOGIC_VECTOR(2 downto 0);
	AM_S : OUT STD_LOGIC_VECTOR(2 downto 0);
	AXM_S : OUT STD_LOGIC;
	DOM_S : OUT STD_LOGIC_VECTOR(2 downto 0);
	AOM_S : OUT STD_LOGIC;
	RED_S : OUT STD_LOGIC_VECTOR(3 downto 0);
	IC_En,
	IR_En,
	IDR_En,
	ADR_En,
	FR_En,
	ACR_En,
	GPR_En : OUT STD_LOGIC;
	rw : OUT STD_LOGIC
);
end component;

-- signals

-- Instruction Data Reg low and high word
signal IDR_l, IDR_h : STD_LOGIC_VECTOR(3 downto 0);

-- Instructions
signal
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
hlt : STD_LOGIC;

signal opc_aux : STD_LOGIC_VECTOR(2 downto 0);
signal RM_S_aux : STD_LOGIC;
signal RXM_S_aux : STD_LOGIC_VECTOR(3 downto 0);
signal RYM_S_aux : STD_LOGIC_VECTOR(3 downto 0);
signal ICM_S_aux : STD_LOGIC_VECTOR(2 downto 0);
signal AM_S_aux : STD_LOGIC_VECTOR(2 downto 0);
signal AXM_S_aux : STD_LOGIC;
signal DOM_S_aux : STD_LOGIC_VECTOR(2 downto 0);
signal AOM_S_aux : STD_LOGIC;
signal RED_S_aux : STD_LOGIC_VECTOR(3 downto 0);
signal 
IC_En_aux,
IR_En_aux,
IDR_En_aux,
ADR_En_aux,
FR_En_aux,
ACR_En_aux,
GPR_En_aux : STD_LOGIC;
signal rw_aux : STD_LOGIC;


-- States
signal
fetchInst,
S1,
S2,
fetchData,
decode,
S5,
S6 : STD_LOGIC;
signal 
incIC,
saveIC : STD_LOGIC;

signal
IC_En_active,
IDR_En_active,
IR_En_active : STD_LOGIC;

-- State machine clock
signal sm_clk : STD_LOGIC;

begin

-- Seven State State Machine
SSSM: SevenState_sm port map(
	sm_clk,
	reset,
	
	fetchInst,
	S1,
	S2,
	fetchData,
	decode,
	S5,
	S6
);

-- Instruction Decoder
ID: InstDecoder port map(
	inst,
	
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
	hlt
);

-- Operation Decoder
OD: OpDecoder port map(
	
	decode,
	ZF,
	NF,
	OVF,
	IDR_l,
	IDR_h,
	
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
	hlt,

	opc_aux,
	RM_S_aux,
	RXM_S_aux,
	RYM_S_aux,
	ICM_S_aux,
	AM_S_aux,
	AXM_S_aux,
	DOM_S_aux,
	AOM_S_aux,
	RED_S_aux,
	IC_En_aux,
	IR_En_aux,
	IDR_En_aux,
	ADR_En_aux,
	FR_En_aux,
	ACR_En_aux,
	GPR_En_aux,
	rw_aux
);

IDR_l <= IDR(3 downto 0);
IDR_h <= IDR(7 downto 4);
sm_clk <= clk and (not hlt);

-- states
incIC <= S1 or S5;
saveIC <= S2 or S6;

-- actives
IC_En_active <= IC_En_aux or saveIC;
IDR_En_active <= IDR_En_aux or fetchData;
IR_En_active <= IR_En_aux or fetchInst;

-- outputs

opc(0) <= opc_aux(0);
opc(1) <= opc_aux(1) or incIC;
opc(2) <= opc_aux(2);
RM_S <= RM_S_aux;
RXM_S <= RXM_S_aux;
RYM_S <= RYM_S_aux;
ICM_S <= ICM_S_aux;
AM_S <= AM_S_aux;
AXM_S <= AXM_S_aux or incIC;
DOM_S <= DOM_S_aux;
AOM_S <= AOM_S_aux;
RED_S <= RED_S_aux;
IC_En <= IC_En_active and (not clk);
IDR_En <= IDR_En_active and (not clk);
IR_En <= IR_En_active and (not clk);
ADR_En <= ADR_En_aux and (not clk);
FR_En <= FR_En_aux and (not clk);
PACR_En <= ACR_En_aux and (not clk);
IACR_En <= incIC and (not clk);
GPR_En <= GPR_En_aux and (not clk);

rw <= rw_aux;
fetch <= fetchInst or fetchData;

state_0 <= fetchInst;
state_1 <= S1;
state_2 <= S2;
state_3 <= fetchData;
state_4 <= decode;
state_5 <= S5;
state_6 <= S6;

end Behavioral;

