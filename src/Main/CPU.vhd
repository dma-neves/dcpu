
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU is
Port(
	reset : in STD_LOGIC;
	clk : in STD_LOGIC;
	dataIn : in STD_LOGIC_VECTOR(7 downto 0);

	regSel : in STD_LOGIC_VECTOR(2 downto 0);
	
	address : out STD_LOGIC_VECTOR(7 downto 0);
	dataOut : out STD_LOGIC_VECTOR(7 downto 0);
	readWrite : out STD_LOGIC;
	fetch : out STD_LOGIC; 

	GPR, regIC, regIR, regIDR, regIACR, regPACR, regADR : out STD_LOGIC_VECTOR(7 downto 0);
	state_0, state_1, state_2, state_3, state_4, state_5, state_6 : out STD_LOGIC
);
end CPU;

architecture Behavioral of CPU is

-- Components

component ControlUnit is
Port(
	clk, reset : in STD_LOGIC;
	inst : in STD_LOGIC_VECTOR(7 downto 0);
	IDR : in STD_LOGIC_VECTOR(7 downto 0);
	ZF, NF, OVF : in STD_LOGIC;

	opc : OUT STD_LOGIC_VECTOR(2 downto 0);
	RM_S : OUT STD_LOGIC;
	RXM_S : OUT STD_LOGIC_VECTOR(2 downto 0);
	RYM_S : OUT STD_LOGIC_VECTOR(2 downto 0);
	ICM_S : OUT STD_LOGIC_VECTOR(1 downto 0);
	AM_S : OUT STD_LOGIC_VECTOR(1 downto 0);
	AXM_S : OUT STD_LOGIC;
	DOM_S : OUT STD_LOGIC_VECTOR(1 downto 0);
	AOM_S : OUT STD_LOGIC;
	RED_S : OUT STD_LOGIC_VECTOR(2 downto 0);
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

component DeMux16_1b is
Port(
	d : in STD_LOGIC;
	sel : in STD_LOGIC_VECTOR(3 downto 0);
	
	I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : out STD_LOGIC
);
end component;

component Mux8 is
Port(
	I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC_VECTOR(2 downto 0);
	
	o : out STD_LOGIC_VECTOR(7 downto 0)
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

-- Specific registers
signal FR_in, FR_out : STD_LOGIC_VECTOR(2 downto 0);
signal FR_en : STD_LOGIC;
signal IR_in, IR_out : STD_LOGIC_VECTOR(7 downto 0);
signal IR_en : STD_LOGIC;
signal IDR_in, IDR_out : STD_LOGIC_VECTOR(7 downto 0);
signal IDR_en : STD_LOGIC;
signal ADR_in, ADR_out : STD_LOGIC_VECTOR(7 downto 0);
signal ADR_en : STD_LOGIC;
signal IC_in, IC_out : STD_LOGIC_VECTOR(7 downto 0);
signal IC_en : STD_LOGIC;
signal IACR_in, IACR_out : STD_LOGIC_VECTOR(7 downto 0);
signal IACR_en : STD_LOGIC;
signal PACR_in, PACR_out : STD_LOGIC_VECTOR(7 downto 0);
signal PACR_en : STD_LOGIC;

-- General purpose regsiters
signal RA_in, RA_out : STD_LOGIC_VECTOR(7 downto 0);
signal RA_en : STD_LOGIC;
signal RB_in, RB_out : STD_LOGIC_VECTOR(7 downto 0);
signal RB_en : STD_LOGIC;
signal RC_in, RC_out : STD_LOGIC_VECTOR(7 downto 0);
signal RC_en : STD_LOGIC;
signal RD_in, RD_out : STD_LOGIC_VECTOR(7 downto 0);
signal RD_en : STD_LOGIC;
signal RE_in, RE_out : STD_LOGIC_VECTOR(7 downto 0);
signal RE_en : STD_LOGIC;
signal RF_in, RF_out : STD_LOGIC_VECTOR(7 downto 0);
signal RF_en : STD_LOGIC;
signal RG_in, RG_out : STD_LOGIC_VECTOR(7 downto 0);
signal RG_en : STD_LOGIC;
signal RH_in, RH_out : STD_LOGIC_VECTOR(7 downto 0);
signal RH_en : STD_LOGIC;

-- Multiplexers
signal AOM_S : STD_LOGIC;
signal RM_S : STD_LOGIC;
signal RM_o : STD_LOGIC_VECTOR(7 downto 0);
signal AXM_S : STD_LOGIC;
signal AXM_o : STD_LOGIC_VECTOR(7 downto 0);
signal ICM_S : STD_LOGIC_VECTOR(1 downto 0);
signal DOM_S : STD_LOGIC_VECTOR(1 downto 0);
signal AM_S : STD_LOGIC_VECTOR(1 downto 0);
signal RXM_S : STD_LOGIC_VECTOR(2 downto 0);
signal RYM_S : STD_LOGIC_VECTOR(2 downto 0);
signal RXM_o : STD_LOGIC_VECTOR(7 downto 0);
signal RYM_o : STD_LOGIC_VECTOR(7 downto 0);

-- DeMultiplexers
signal RED_S : STD_LOGIC_VECTOR(2 downto 0);
signal RED_d : STD_LOGIC;
signal RED_S_4b : STD_LOGIC_VECTOR(3 downto 0);

-- ALU
signal opc : STD_LOGIC_VECTOR(2 downto 0);
signal result : STD_LOGIC_VECTOR(7 downto 0);

begin

-- Port maps
CU: ControlUnit port map(
	clk => clk,
	reset => reset,
	inst => IR_out,
	IDR => IDR_out,
	ZF => FR_out(0),
	NF => FR_out(1),
	OVF => FR_out(2),

	opc => opc,
	RM_S => RM_S,
	RXM_S => RXM_S,
	RYM_S => RYM_S,
	ICM_S => ICM_S,
	AM_S => AM_S,
	AXM_S => AXM_S,
	DOM_S => DOM_S,
	AOM_S => AOM_S,
	RED_S => RED_S,
	IC_En => IC_en,
	IR_En => IR_en,
	IDR_En => IDR_en,
	ADR_En => ADR_en,
	FR_En => FR_en,
	PACR_En => PACR_en,
	IACR_En => IACR_en,
	GPR_En => RED_d,
	rw => readWrite,
	fetch => fetch,
	state_0 => state_0,
	state_1 => state_1,
	state_2 => state_2,
	state_3 => state_3,
	state_4 => state_4,
	state_5 => state_5,
	state_6 => state_6
);

-- Specific registers

IR_in <= dataIn;
IDR_in <= dataIn;

ADR: Register_8bit port map(
	En => ADR_en,
	R => reset,
	DIn => ADR_in,
	DOut => ADR_out
);

IR: Register_8bit port map(
	En => IR_en,
	R => reset,
	DIn => IR_in,
	DOut => IR_out
);

IDR: Register_8bit port map(
	En => IDR_en,
	R => reset,
	DIn => IDR_in,
	DOut => IDR_out
);

IC: Register_8bit port map(
	En => IC_en,
	R => reset,
	DIn => IC_in,
	DOut => IC_out
);

IACR: Register_8bit port map(
	En => IACR_en,
	R => reset,
	DIn => IACR_in,
	DOut => IACR_out
);

PACR: Register_8bit port map(
	En => PACR_en,
	R => reset,
	DIn => PACR_in,
	DOut => PACR_out
);

FR: Register_3bit port map(
	En => FR_en,
	R => reset,
	DIn => FR_in,
	DOut => FR_out
);

-- General purpose regsiters

RA: Register_8bit port map(
	En => RA_en,
	R => reset,
	DIn => RA_in,
	DOut => RA_out
);

RB: Register_8bit port map(
	En => RB_en,
	R => reset,
	DIn => RB_in,
	DOut => RB_out
);

RC: Register_8bit port map(
	En => RC_en,
	R => reset,
	DIn => RC_in,
	DOut => RC_out
);

RD: Register_8bit port map(
	En => RD_en,
	R => reset,
	DIn => RD_in,
	DOut => RD_out
);

RE: Register_8bit port map(
	En => RE_en,
	R => reset,
	DIn => RE_in,
	DOut => RE_out
);

RF: Register_8bit port map(
	En => RF_en,
	R => reset,
	DIn => RF_in,
	DOut => RF_out
);

RG: Register_8bit port map(
	En => RG_en,
	R => reset,
	DIn => RG_in,
	DOut => RG_out
);

RH: Register_8bit port map(
	En => RH_en,
	R => reset,
	DIn => RH_in,
	DOut => RH_out
);

-- ALU

ALU_M: ALU port map(
	a => AXM_o,
	b => RYM_o,
	opc => opc,
	
	result => result,
	zeroF => FR_in(0),
	negativeF => FR_in(1),
	overflowF => FR_in(2)
);

IACR_in <= result;
PACR_in <= result;

-- Multiplexers

RM: Mux2 port map(
	I0 => PACR_out, 
	I1 => dataIn,
	sel => RM_S,
	o => RM_o
);

RA_in <= RM_o;
RB_in <= RM_o;
RC_in <= RM_o;
RD_in <= RM_o;
RE_in <= RM_o;
RF_in <= RM_o;
RG_in <= RM_o;
RH_in <= RM_o;

RXM: Mux8 port map(
	I0 => RA_out,
	I1 => RB_out,
	I2 => RC_out,
	I3 => RD_out,
	I4 => RE_out,
	I5 => RF_out,
	I6 => RG_out,
	I7 => RH_out,
	sel => RXM_S,
	o => RXM_o
);
	
RYM: Mux8 port map(
	I0 => RA_out,
	I1 => RB_out,
	I2 => RC_out,
	I3 => RD_out,
	I4 => RE_out,
	I5 => RF_out,
	I6 => RG_out,
	I7 => RH_out,
	sel => RYM_S,
	o => RYM_o
);
	
ICM: Mux4 port map(
	I0 => IACR_out,
	I1 => IDR_out,
	I2 =>ADR_out,
	I3 => "00000000",
	sel => ICM_S,
	o => IC_in
);
	
AM: Mux4 port map(
	I0 => RXM_o,
	I1 => PACR_out,
	I2 => IDR_out,
	I3 => "00000000",
	sel => AM_S,
	o => ADR_in
);
	
AXM: Mux2 port map(
	I0 => RXM_o, 
	I1 => IC_out,
	sel => AXM_S,
	o => AXM_o
);
	
DOM: Mux4 port map(
	I0 => RXM_o,
	I1 => IC_out,
	I2 => PACR_out,
	I3 => IDR_out,
	sel => DOM_S,
	o =>  dataOut
);
	
AOM: Mux2 port map(
	I0 => IC_out, 
	I1 => ADR_out,
	sel => AOM_S,
	o => address
);

GPR_Selector: Mux8 port map(
	I0 => RA_out,
	I1 => RB_out,
	I2 => RC_out,
	I3 => RD_out,
	I4 => RE_out,
	I5 => RF_out,
	I6 => RG_out,
	I7 => RH_out,
	sel => regSel,
	o => GPR
);

-- DeMultiplexers
	
RED_S_4b(2 downto 0) <= RED_S(2 downto 0);
RED_S_4b(3) <= '0';

RED: DeMux16_1b port map(
	d => RED_d,
	sel => RED_S_4b,
	I0 => RA_en,
	I1 => RB_en,
	I2 => RC_en,
	I3 => RD_en,
	I4 => RE_en,
	I5 => RF_en,
	I6 => RG_en,
	I7 => RH_en,

	I8 => open,
	I9 => open,
	I10 => open,
	I11 => open,
	I12 => open,
	I13 => open,
	I14 => open,
	I15 => open
);
	

end Behavioral;

