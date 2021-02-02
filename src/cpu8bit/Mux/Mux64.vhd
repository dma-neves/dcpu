
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux64 is
Port(
	sel : in STD_LOGIC_VECTOR(5 downto 0);
	
	I0, I1, I2, I3, I4, I5, I6, I7,
	I8, I9, I10, I11, I12, I13, I14, I15,
	I16, I17, I18, I19, I20, I21, I22, I23,
	I24, I25, I26, I27, I28, I29, I30, I31,
	I32, I33, I34, I35, I36, I37, I38, I39,
	I40, I41, I42, I43, I44, I45, I46, I47,
	I48, I49, I50, I51, I52, I53, I54, I55,
	I56, I57, I58, I59, I60, I61, I62, I63
	: in STD_LOGIC_VECTOR(7 downto 0);
	
	d : out STD_LOGIC_VECTOR(7 downto 0)
);
end Mux64;

architecture Behavioral of Mux64 is

component Mux16 is
Port(
	sel : in STD_LOGIC_VECTOR(3 downto 0);
	I0, I1, I2, I3,
	I4, I5, I6, I7,
	I8, I9, I10, I11,
	I12, I13, I14, I15
	: in STD_LOGIC_VECTOR(7 downto 0);
	
	d : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component Mux4 is
Port(
	I0, I1, I2, I3 : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	o : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

signal M0_d, M1_d, M2_d, M3_d : STD_LOGIC_VECTOR(7 downto 0);

begin

M16_0: Mux16 port map(sel(3 downto 0), I0 , I1 , I2 , I3 , I4 , I5 , I6 , I7 , I8 , I9 , I10, I11, I12, I13, I14, I15, M0_d);
M16_1: Mux16 port map(sel(3 downto 0), I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, M1_d);
M16_2: Mux16 port map(sel(3 downto 0), I32, I33, I34, I35, I36, I37, I38, I39, I40, I41, I42, I43, I44, I45, I46, I47, M2_d);
M16_3: Mux16 port map(sel(3 downto 0), I48, I49, I50, I51, I52, I53, I54, I55, I56, I57, I58, I59, I60, I61, I62, I63, M3_d);

M4: Mux4 port map(M0_d, M1_d, M2_d, M3_d, sel(5 downto 4), d);

end Behavioral;

