library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is

Port (
	a : IN STD_LOGIC_VECTOR(15 downto 0);
	b : IN STD_LOGIC_VECTOR(15 downto 0);
	opc : IN STD_LOGIC_VECTOR(2 downto 0);
	
	result : OUT STD_LOGIC_VECTOR(15 downto 0);
	zeroF : OUT STD_LOGIC;
	negativeF : OUT STD_LOGIC;
	overflowF : OUT STD_LOGIC
);

end ALU;

architecture Behavioral of ALU is

signal isc, iac, inc, addC, negOF, overf, carry : STD_LOGIC;
signal opc_2 : STD_LOGIC_VECTOR(1 downto 0);
signal opc_M5 : STD_LOGIC_VECTOR(2 downto 0);
signal om4, om2, om5, addR, negA, notA, andAB, orAB : STD_LOGIC_VECTOR(15 downto 0);

component Mux4
Port(
	I0, I1, I2, I3 : in STD_LOGIC_VECTOR(15 downto 0);
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	o : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component Mux2
Port(
	I0, I1 : in STD_LOGIC_VECTOR(15 downto 0);
	sel : in STD_LOGIC;
	o : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component isOpCode
Port(
	opc : in STD_LOGIC_VECTOR(2 downto 0); -- Actual opc
	cmpOpc : in STD_LOGIC_VECTOR(2 downto 0); -- opc to compare with
	
	ioc : out STD_LOGIC
);
end component;

component Adder
Port(
	a : IN STD_LOGIC_VECTOR(15 downto 0);
	b : IN STD_LOGIC_VECTOR(15 downto 0);
	
	result : OUT STD_LOGIC_VECTOR(15 downto 0);
	carryOut : OUT STD_LOGIC
);
end component;

component Negate
Port(
	a : in STD_LOGIC_VECTOR(15 downto 0);
	neg_a : out STD_LOGIC_VECTOR(15 downto 0);
	overflow : out STD_LOGIC
);
end component;

component Not_16
Port(
	a : in STD_LOGIC_VECTOR(15 downto 0);
	not_a : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component And_16
Port(
	a : in STD_LOGIC_VECTOR(15 downto 0);
	b : in STD_LOGIC_VECTOR(15 downto 0);
	
	a_and_b : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component Or_16
Port(
	a : in STD_LOGIC_VECTOR(15 downto 0);
	b : in STD_LOGIC_VECTOR(15 downto 0);
	
	a_and_b : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component Mux5
Port(
	I0, I1, I2, I3, I4_7 : in STD_LOGIC_VECTOR(15 downto 0);
	sel : in STD_LOGIC_VECTOR(2 downto 0);
	
	o : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component isNegative
Port(
	a : in STD_LOGIC_VECTOR(15 downto 0);
	isNeg : out STD_LOGIC
);
end component;

component isZero
Port(
	a : in STD_LOGIC_VECTOR(15 downto 0);
	isZero : out STD_LOGIC
);
end component;

begin

IS_SUB_CODE_M: isOpCode port map (opc, "001", isc);
IS_ADD_CODE_M: isOpCode port map (opc, "000", iac);
IS_NEG_CODE_M: isOpCode port map (opc, "100", inc);

opc_2(0) <= opc(0);
opc_2(1) <= opc(1);

MUX4_M: Mux4 port map (B, negA, "0000000000000001", "1111111111111111", opc_2, om4);
MUX2_M: Mux2 port map (A, B, isc, om2);

ADDER_M: Adder port map(A, om4, addR, addC);
NEGATE_M: Negate port map(om2, negA, negOF);
NOT_M: Not_16 port map(A, notA);
AND_M: And_16 port map(a, b, andAB);
OR_M: Or_16 port map(a, b, orAB);

opc_M5(0) <= opc(0);
opc_M5(1) <= opc(1);
opc_M5(2) <= not opc(2);

MUx5_M: Mux5 port map (negA, notA, andAB, orAB, addR, opc_M5, om5);

IS_NEGATIVE_M: isNegative port map (om5, negativeF);
IS_ZERO_M: isZero port map (om5, zeroF);

carry <= addC and iac;
overf <= negOF and inc;
overflowF <= carry or overf;

result <= om5;

end Behavioral;

