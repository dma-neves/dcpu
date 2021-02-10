
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU is
Port(
	reset, start : in STD_LOGIC;
	clk : in STD_LOGIC;
	dataIn : in STD_LOGIC_VECTOR(7 downto 0);
	
	address : out STD_LOGIC_VECTOR(7 downto 0);
	dataOut : out STD_LOGIC_VECTOR(7 downto 0);
	readWrite : out STD_LOGIC;
	fetch : out STD_LOGIC; 
	
	regA, regB, regC, regIC, regIR, regIDR, regIACR, regPACR : out STD_LOGIC_VECTOR(7 downto 0)
);
end CPU;

architecture Behavioral of CPU is

-- Components

component ControlUnit is
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
	PACR_En,
	IACR_En,
	RW : out STD_LOGIC;
	
	fetch : out STD_LOGIC
);
end component;

component Register_8bit is
Port(
	En, R : in STD_LOGIC;
	DIn : in STD_LOGIC_VECTOR(7 downto 0);
	DOut : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component Register_3bit is
Port(
	En, R : in STD_LOGIC;
	DIn : in STD_LOGIC_VECTOR(2 downto 0);
	DOut : out STD_LOGIC_VECTOR(2 downto 0)
);
end component;

component ALU is
Port (
	a : IN STD_LOGIC_VECTOR(7 downto 0);
	b : IN STD_LOGIC_VECTOR(7 downto 0);
	opc : IN STD_LOGIC_VECTOR(2 downto 0);
	
	result : OUT STD_LOGIC_VECTOR(7 downto 0);
	zeroF : OUT STD_LOGIC;
	negativeF : OUT STD_LOGIC;
	overflowF : OUT STD_LOGIC
);
end component;

component DeMux5 is
Port(
	d : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC_VECTOR(2 downto 0);
	
	I0, I1, I2, I3, I4 : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component Mux4 is
Port(
	I0, I1, I2, I3 : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	o : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component Mux2 is
Port(
	I0, I1 : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC;
	o : out STD_LOGIC_VECTOR(7 downto 0)	
);
end component;

-- Signals

signal zeroF, negativeF, overflowF : STD_LOGIC;

signal
ZF,
NF,
OVF : STD_LOGIC;

signal dataOut_S : STD_LOGIC_VECTOR(1 downto 0);
signal dataIn_S : STD_LOGIC_VECTOR(2 downto 0);
signal opc : STD_LOGIC_VECTOR(2 downto 0);

signal
adr_S : STD_LOGIC;
signal
RA_S : STD_LOGIC_VECTOR(1 downto 0);
signal
ALU_A_S : STD_LOGIC;
signal
ALU_B_S : STD_LOGIC_VECTOR(1 downto 0);
signal
IC_S,
RA_En,
RB_En,
RC_En,
IC_En,
IDR_En,
IR_En,
PACR_En,
IACR_En,
RW : STD_LOGIC;

signal
RA_In, RA_Out,
RB_In, RB_Out,
RC_In, RC_Out,
IR_In, IR_Out,
IC_In, IC_Out,
IDR_In, IDR_Out,
PACR_In, PACR_Out,
IACR_In, IACR_Out : STD_LOGIC_VECTOR(7 downto 0);

signal ALU_a, ALU_b : STD_LOGIC_VECTOR(7 downto 0);

signal DI_0 : STD_LOGIC_VECTOR(7 downto 0);

signal ALU_result : STD_LOGIC_VECTOR(7 downto 0);

begin

regA <= RA_Out;
regB <= RB_Out;
regC <= RC_Out;
regIC <= IC_Out;
regIR <= IR_Out;
regIDR <= IDR_Out;
regIACR <= IACR_Out;
regPACR <= PACR_Out;

readWrite <= RW;

PACR_In <= ALU_result;
IACR_In <= ALU_result;

-- Port maps
CU: ControlUnit port map(
	clk => clk,
	reset => reset,
	start => start,
	inst => IR_Out,
	ZF => ZF,
	NF => NF,
	OVF => OVF,
	
	dataOut_S => dataOut_S,
	dataIn_S => dataIn_S,
	opc => opc,
	adr_S => adr_S,
	RA_S => RA_S,
	ALU_A_S => ALU_A_S,
	ALU_B_S => ALU_B_S,
	IC_S => IC_S,
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

RA: Register_8bit port map(
	En => RA_En,
	R => reset,

	DIn => RA_In,
	DOut => RA_Out
);

RB: Register_8bit port map(
	En => RB_En,
	R => reset,

	DIn => RB_In,
	DOut => RB_Out
);

RC: Register_8bit port map(
	En => RC_En,
	R => reset,

	DIn => RC_In,
	DOut => RC_Out
);

IR: Register_8bit port map(
	En => IR_En,
	R => reset,

	DIn => IR_In,
	DOut => IR_Out
);

IDR: Register_8bit port map(
	En => IDR_En,
	R => reset,

	DIn => IDR_In,
	DOut => IDR_Out
);

IC: Register_8bit port map(
	En => IC_En,
	R => reset,

	DIn => IC_In,
	DOut => IC_Out
);

IACR: Register_8bit port map(
	En => IACR_En,
	R => reset,
	
	DIn => IACR_In,
	DOut => IACR_Out
);

PACR: Register_8bit port map(
	En => PACR_En,
	R => reset,

	DIn => PACR_In,
	DOut => PACR_Out
);

FLAGR: Register_3bit port map(
	En => PACR_En,
	R => reset,
	
	DIn(0) => zeroF,
	DIn(1) => negativeF,
	DIn(2) => overflowF,
	
	DOut(0) => ZF,
	DOut(1) => NF,
	DOut(2) => OVF
);

ALU_M: ALU port map(
	a => ALU_a,
	b => ALU_b,
	opc => opc,
	
	result => ALU_result,
	zeroF => zeroF,
	negativeF => negativeF,
	overflowF => overflowF
);

DEMUX_DATAIN: DeMux5 port map(dataIn, dataIn_S, DI_0, RB_In, RC_In, IR_In, IDR_In);
MUX_DATAOUT: Mux4 port map(RC_Out, RB_Out, RA_Out, PACR_Out, dataOut_S, dataOut);
MUX_ADDRESS: Mux2 port map(IC_Out, IDR_Out, adr_S, address);

MUX_A: Mux4 port map(PACR_Out, DI_0, IDR_Out, "00000000", RA_S, RA_In);
MUX_IC: Mux2 port map(IACR_Out, IDR_Out, IC_S, IC_In);
MUX_ALU_A: Mux2 port map(RA_Out, IC_Out, ALU_A_S, ALU_a);
MUX_ALU_B: Mux4 port map(RB_Out, RC_Out, IDR_Out, "00000000", ALU_B_S, ALU_b);


end Behavioral;

