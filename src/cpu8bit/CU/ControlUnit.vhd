library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
Port(
	clk, reset, start : in STD_LOGIC;
	inst : in STD_LOGIC_VECTOR(7 downto 0);
	ZF, NF, OVF : in STD_LOGIC;
	
	dataOut_S : out STD_LOGIC_VECTOR(1 downto 0);
	dataIn_S : out STD_LOGIC_VECTOR(2 downto 0);
	opc : out STD_LOGIC_VECTOR(2 downto 0);
	
	adr_S : out STD_LOGIC;
	RA_S : out STD_LOGIC_VECTOR(1 downto 0);
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
end ControlUnit;

architecture Behavioral of ControlUnit is

-- components

component SevenState_sm is
port(
	clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	start : in STD_LOGIC;
	
	S0, S1, S2, S3, S4, S5, S6 : out STD_LOGIC
);
end component;

component InstDecoder is
Port(
	inst : in STD_LOGIC_VECTOR(7 downto 0);
	
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
	lod_X_RA,

	jmp_X,
	jmpz_X,
	jmpn_X,
	jmpo_X,
	hlt
	: out STD_LOGIC
);
end component;

component OpDecoder is
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
	lod_X_RA,
	jmp_X,
	jmpz_X,
	jmpn_X,
	jmpo_X : in STD_LOGIC;
	
	dataOut_S : out STD_LOGIC_VECTOR(1 downto 0);
	dataIn_S : out STD_LOGIC_VECTOR(2 downto 0);
	opc : out STD_LOGIC_VECTOR(2 downto 0);
	
	adr_S : out STD_LOGIC;
	RA_S : out STD_LOGIC_VECTOR(1 downto 0);
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
end component;

-- signals

signal
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
lod_X_RA,
jmp_X,
jmpz_X,
jmpn_X,
jmpo_X,
hlt : STD_LOGIC;

signal dataOut_S_aux : STD_LOGIC_VECTOR(1 downto 0);
signal dataIn_S_aux : STD_LOGIC_VECTOR(2 downto 0);
signal opc_aux : STD_LOGIC_VECTOR(2 downto 0);

signal ALU_B_S_aux : STD_LOGIC_VECTOR(1 downto 0);
signal RA_S_aux : STD_LOGIC_VECTOR(1 downto 0);

signal
adr_S_aux,
ALU_A_S_aux,
IC_S_aux,
RA_En_aux,
RB_En_aux,
RC_En_aux,
IC_En_aux,
IDR_En_aux,
IR_En_aux,
ACR_En_aux,
RW_aux : STD_LOGIC;

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
IR_En_active,
ACR_En_active : STD_LOGIC;

signal sm_clk : STD_LOGIC;

begin

sm_clk <= clk and (not hlt);

-- Seven State State Machine
SSSM: SevenState_sm port map(
	sm_clk,
	reset,
	start,
	
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
	lod_X_RA,
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
	lod_X_RA,
	jmp_X,
	jmpz_X,
	jmpn_X,
	jmpo_X,
	
	dataOut_S_aux,
	dataIn_S_aux,
	opc_aux,
	adr_S_aux,
	RA_S_aux,
	ALU_A_S_aux,
	ALU_B_S_aux,
	IC_S_aux,
	RA_En_aux,
	RB_En_aux,
	RC_En_aux,
	IC_En_aux,
	IDR_En_aux,
	IR_En_aux,
	ACR_En_aux,
	RW_aux
);

-- states
incIC <= S1 or S5;
saveIC <= S2 or S6;

-- actives
IC_En_active <= IC_En_aux or saveIC;
IDR_En_active <= IDR_En_aux or fetchData;
IR_En_active <= IR_En_aux or fetchInst;
ACR_En_active <= ACR_En_aux or incIC;

-- outputs
dataOut_S <= dataOut_S_aux;

dataIn_S(0) <= dataIn_S_aux(0) or fetchInst or fetchData;
dataIn_S(1) <= dataIn_S_aux(1) or fetchInst;
dataIn_S(2) <= dataIn_S_aux(2) or fetchData;

opc(0) <= opc_aux(0);
opc(1) <= opc_aux(1) or incIC;
opc(2) <= opc_aux(2);

adr_S <= adr_S_aux;
RA_S <= RA_S_aux;
ALU_A_S <= ALU_A_S_aux or incIC;
ALU_B_S <= ALU_B_S_aux;
IC_S <= IC_S_aux;
RA_En <= RA_En_aux and (not clk);
RB_En <= RB_En_aux and (not clk);
RC_En <= RC_En_aux and (not clk);
IC_En <= IC_En_active and (not clk);
IDR_En <= IDR_En_active and (not clk);
IR_En <= IR_En_active and (not clk);
ACR_En <= ACR_En_active and (not clk);
RW <= RW_aux and (not clk);

end Behavioral;

