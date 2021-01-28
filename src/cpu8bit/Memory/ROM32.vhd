library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM32 is
Port(
	adr : in STD_LOGIC_VECTOR(4 downto 0);
	En : in STD_LOGIC;
	DO : out STD_LOGIC_VECTOR(7 downto 0)
);
end ROM32;

architecture Behavioral of ROM32 is

component Mux32
Port(
	sel : in STD_LOGIC_VECTOR(4 downto 0);
	
	I0, I1, I2, I3,
	I4, I5, I6, I7,
	I8, I9, I10, I11,
	I12, I13, I14, I15,
	I16, I17, I18, I19,
	I20, I21, I22, I23,
	I24, I25, I26, I27,
	I28, I29, I30, I31 :
	in STD_LOGIC_VECTOR(7 downto 0);
	
	d : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;


signal MUX_d : STD_LOGIC_VECTOR(7 downto 0);

begin

M32: Mux32 port map (adr,
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",
--"00000000","00000000",

"00010110","00000111", -- lod 7 RA
"00001111","00000000", -- str RA 0
"00010000","00000000", -- lod 0 RB
"00010110","00000101", -- lod 5 RA
"00000000","00000000", -- add RA RB
"00010100","00000000", -- str ACR RA
"00011011","00000000", -- hlt
"00000000","00000000",
"00000000","00000000",
"00000000","00000000",
"00000000","00000000",
"00000000","00000000",
"00000000","00000000",
"00000000","00000000",
"00000000","00000000",
"00000000","00000000",

MUX_d
);

DO(0) <= MUX_d(0) and En;
DO(1) <= MUX_d(1) and En;
DO(2) <= MUX_d(2) and En;
DO(3) <= MUX_d(3) and En;
DO(4) <= MUX_d(4) and En;
DO(5) <= MUX_d(5) and En;
DO(6) <= MUX_d(6) and En;
DO(7) <= MUX_d(7) and En;

end Behavioral;

