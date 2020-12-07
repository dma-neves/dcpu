library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MemRow16b is
Port(
	adr : in STD_LOGIC_VECTOR(3 downto 0);
	R : in STD_LOGIC;
	rw : in STD_LOGIC;
	DI : in STD_LOGIC;
	DO : out STD_LOGIC
);
end MemRow16b;

architecture Behavioral of MemRow16b is

component DFlipFlop
Port(
	D, En, R : in STD_LOGIC;
	Q : OUT STD_LOGIC
);
end component;

component DeMux16_1b
Port(
	d : in STD_LOGIC;
	sel : in STD_LOGIC_VECTOR(3 downto 0);
	
	I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : out STD_LOGIC
);
end component;

signal I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : STD_LOGIC;

signal DFF00En, DFF00Q, DFF00DO : STD_LOGIC;
signal DFF01En, DFF01Q, DFF01DO : STD_LOGIC;
signal DFF02En, DFF02Q, DFF02DO : STD_LOGIC;
signal DFF03En, DFF03Q, DFF03DO : STD_LOGIC;
signal DFF04En, DFF04Q, DFF04DO : STD_LOGIC;
signal DFF05En, DFF05Q, DFF05DO : STD_LOGIC;
signal DFF06En, DFF06Q, DFF06DO : STD_LOGIC;
signal DFF07En, DFF07Q, DFF07DO : STD_LOGIC;
signal DFF08En, DFF08Q, DFF08DO : STD_LOGIC;
signal DFF09En, DFF09Q, DFF09DO : STD_LOGIC;
signal DFF10En, DFF10Q, DFF10DO : STD_LOGIC;
signal DFF11En, DFF11Q, DFF11DO : STD_LOGIC;
signal DFF12En, DFF12Q, DFF12DO : STD_LOGIC;
signal DFF13En, DFF13Q, DFF13DO : STD_LOGIC;
signal DFF14En, DFF14Q, DFF14DO : STD_LOGIC;
signal DFF15En, DFF15Q, DFF15DO : STD_LOGIC;


begin

DEMUX: DeMux16_1b port map (DI, adr, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15);


DFF00En <= I0 and rw;
DFF00: DFlipFlop port map (DI, DFF00En, R, DFF00Q);
DFF00DO <= DFF00Q and I0 and (not rw);

DFF01En <= I1 and rw;
DFF01: DFlipFlop port map (DI, DFF01En, R, DFF01Q);
DFF01DO <= DFF01Q and I1 and (not rw);

DFF02En <= I2 and rw;
DFF02: DFlipFlop port map (DI, DFF02En, R, DFF02Q);
DFF02DO <= DFF02Q and I2 and (not rw);

DFF03En <= I3 and rw;
DFF03: DFlipFlop port map (DI, DFF03En, R, DFF03Q);
DFF03DO <= DFF03Q and I3 and (not rw);

DFF04En <= I4 and rw;
DFF04: DFlipFlop port map (DI, DFF04En, R, DFF04Q);
DFF04DO <= DFF04Q and I4 and (not rw);

DFF05En <= I5 and rw;
DFF05: DFlipFlop port map (DI, DFF05En, R, DFF05Q);
DFF05DO <= DFF05Q and I5 and (not rw);

DFF06En <= I6 and rw;
DFF06: DFlipFlop port map (DI, DFF06En, R, DFF06Q);
DFF06DO <= DFF06Q and I6 and (not rw);

DFF07En <= I7 and rw;
DFF07: DFlipFlop port map (DI, DFF07En, R, DFF07Q);
DFF07DO <= DFF07Q and I7 and (not rw);

DFF08En <= I8 and rw;
DFF08: DFlipFlop port map (DI, DFF08En, R, DFF08Q);
DFF08DO <= DFF08Q and I8 and (not rw);

DFF09En <= I9 and rw;
DFF09: DFlipFlop port map (DI, DFF09En, R, DFF09Q);
DFF09DO <= DFF09Q and I9 and (not rw);

DFF10En <= I10 and rw;
DFF10: DFlipFlop port map (DI, DFF10En, R, DFF10Q);
DFF10DO <= DFF10Q and I10 and (not rw);

DFF11En <= I11 and rw;
DFF11: DFlipFlop port map (DI, DFF11En, R, DFF11Q);
DFF11DO <= DFF11Q and I11 and (not rw);

DFF12En <= I12 and rw;
DFF12: DFlipFlop port map (DI, DFF12En, R, DFF12Q);
DFF12DO <= DFF12Q and I12 and (not rw);

DFF13En <= I13 and rw;
DFF13: DFlipFlop port map (DI, DFF13En, R, DFF13Q);
DFF13DO <= DFF13Q and I13 and (not rw);

DFF14En <= I14 and rw;
DFF14: DFlipFlop port map (DI, DFF14En, R, DFF14Q);
DFF14DO <= DFF14Q and I14 and (not rw);

DFF15En <= I15 and rw;
DFF15: DFlipFlop port map (DI, DFF15En, R, DFF15Q);
DFF15DO <= DFF15Q and I15 and (not rw);

DO <= 
DFF00DO or DFF01DO or DFF02DO or DFF03DO or
DFF04DO or DFF05DO or DFF06DO or DFF07DO or
DFF08DO or DFF09DO or DFF10DO or DFF11DO or
DFF12DO or DFF13DO or DFF14DO or DFF15DO;

end Behavioral;

