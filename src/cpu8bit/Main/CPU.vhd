
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU is
Port(
	reset, start : in STD_LOGIC;
	clk : in STD_LOGIC;
	dataIn : in STD_LOGIC_VECTOR(7 downto 0);
	
	adrOut : out STD_LOGIC_VECTOR(7 downto 0);
	dataOut : out STD_LOGIC_VECTOR(7 downto 0)
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
end component;

component Register_8bit is
Port(
	En, R : in STD_LOGIC;
	DIn : in STD_LOGIC_VECTOR(7 downto 0);
	DOut : out STD_LOGIC_VECTOR(7 downto 0)
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
signal inst : STD_LOGIC_VECTOR(7 downto 0);
signal
ZF,
NF,
OVF : STD_LOGIC;

signal dataOut_S : STD_LOGIC_VECTOR(1 downto 0);
signal dataIn_S : STD_LOGIC_VECTOR(2 downto 0);
signal opc : STD_LOGIC_VECTOR(2 downto 0);

signal
adr_S,
RA_S,
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
ACR_En,
RW : STD_LOGIC;

begin

-- Port maps
CU: ControlUnit port map(
	clk => clk,
	reset => reset,
	start => start,
	inst => inst,
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
	ACR_En => ACR_En,
	RW => RW
);

end Behavioral;

